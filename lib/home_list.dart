import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'home_detail.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:async/async.dart';

class HomeList extends StatefulWidget {

  PageController _pageController;
  Function _setPage;
  Function _setIsRoot;
  HomeList(this._pageController, this._setPage, this._setIsRoot);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {

  final AsyncMemoizer _memoizer = AsyncMemoizer(); // 한번만 실행하기...
  final _scrollController = ScrollController(); // 무한스크롤...
  int nextid = 101;
  int lastid;
  Future _future;
  List list = [];

  bool oncemode = true;

  // 무한스크롤
  _HomeListState() {
    _scrollController.addListener(() {
      // var isEnd = _scrollController.offset == _scrollController.position.maxScrollExtent;
      bool scrollend = _scrollController.offset > _scrollController.position.maxScrollExtent - 400;
      if (scrollend && (nextid != lastid) && (nextid >= 11)) {
        print('!!! scroll !!! : $nextid, $lastid');
        oncemode = false;
        setState(() {
          _future = onceData();
          list = list;
        });
        oncemode = true;
      }
    });
    _future = onceData();
  }

  Future onceData() {
    // print('onceData : $oncemode');
    if(oncemode) {
      return this._memoizer.runOnce(getData);
    } else {
      return getData();
    }
  }

  Future getData() async {
    lastid = nextid;
    // var response = await get('http://192.168.0.4:8080/daangn/from/$nextid');
    var response = await get('/daangn/from/$nextid');
    List data = jsonDecode(response.body);
    nextid = data.last['id'];
    list.addAll(data);
    return list;    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: 
        AppBar( // 상단바
          elevation: 1,
          title: Row(
            children: <Widget>[
              Text('연남동', style: TextStyle( color:Colors.grey[900], fontSize:17, fontWeight: FontWeight.w800),),
              Icon(Icons.keyboard_arrow_down, color:Colors.grey[600]),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Icon(Icons.search, color: Colors.grey[800], size: 28,),
            SizedBox(width:16),
            Icon(Icons.tune, color: Colors.grey[800], size: 28,),
            SizedBox(width:16),
            Icon(Icons.notifications_none, color: Colors.grey[800], size: 28,),
            SizedBox(width:12),
          ],
        ),

      body: 
        FutureBuilder(
          future: onceData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.none && snap.hasData == null) return Container();
            if (snap.data == null) return Container();
            return NotificationListener<OverscrollIndicatorNotification>( // 스크롤 끝나는 부분의 글로우 효과 없애기
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child:
                Scrollbar(
                  child: 
                    ListView.builder(
                    // ListView.separated(
                      // separatorBuilder: (context, index) { return Divider(height:8.0); },
                      key: PageStorageKey('homelist'), // save scroll position
                      controller: _scrollController,
                      // physics: BouncingScrollPhysics(), // 스크롤 끝날 때 바운싱효과
                      // padding: EdgeInsets.symmetric(vertical:10),
                      // scrollDirection: Axis.vertical,
                      // controller: _scrollController,
                      itemCount: list.length,
                      // shrinkWrap: true,
                      itemBuilder: (BuildContext context, int i) =>

                        MaterialButton(
                          onPressed: () async {
                            widget._setIsRoot(false);
                            final returned = await 
                              Navigator.push(context, // Duration을 조절하기 위해 MaterialPageRoute 대신 PageRouteBuilder 사용
                                PageRouteBuilder( // MaterialPageRoute( 
                                  pageBuilder: (c, a1, a2) => HomeDetail(), // builder: (context) => HomeDetail(),
                                  transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                  transitionDuration: Duration(milliseconds: 500),
                                  settings: RouteSettings(arguments: 
                                    {
                                      'tag': 'hero_home' + (i%12+1).toString(),
                                      // 'img': 'assets/pug/'+ (i%12+1).toString() +'.png',
                                      // 'img': 'http://192.168.0.4:8080'+snap.data[i]['thumbnail'],
                                      'img': snap.data[i]['thumbnail'],
                                      'id' : snap.data[i]['id'].toString(),
                                    }
                                  ),
                                ),
                              );                  
                            widget._setIsRoot(true);
                          },
                          minWidth: double.infinity,
                          child: 
                            Column(
                              children: <Widget>[
                                IntrinsicHeight(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Container(
                                              width: 104,
                                              height: 104,
                                              child:
                                                Hero(
                                                  tag: 'hero_home' + (i%12+1).toString(),
                                                  child:
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: 
                                                        FadeInImage.memoryNetwork(
                                                          placeholder: kTransparentImage,
                                                          // image: 'http://192.168.0.4:80/assets/pug/thumb/'+(i%12+1).toString()+'.png',
                                                          // image: 'http://192.168.0.4:8080'+snap.data[i]['thumbnail'],
                                                          image: snap.data[i]['thumbnail'],
                                                          fit: BoxFit.cover, width:120, height: 120,
                                                        ),
                                                        /*
                                                        FadeInImage(
                                                          // placeholder: MemoryImage(kTransparentImage),
                                                          // image: NetworkImage('https://picsum.photos/250?image=10'),
                                                          // placeholder: Image.asset('assets/placeholder.png').image,
                                                          placeholder: MemoryImage(kTransparentImage),
                                                          // image: Image.asset('assets/pug/thumb/'+(i%12+1).toString()+'.png').image,
                                                          image: NetworkImage('http://192.168.0.4:80/assets/pug/thumb/'+(i%12+1).toString()+'.png'),
                                                          fit: BoxFit.cover, width:120, height: 120,
                                                        ),
                                                        */
                                                        // Image.asset('assets/pug/thumb/'+(i%12+1).toString()+'.png', fit: BoxFit.cover, width:120, height: 120,),
                                                    ),
                                                ),
                                            ),
                                            SizedBox(width:16),
                                            Expanded(
                                              child:
                                                Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: 
                                                        // Text('팔과 다리의 가격 '*(i%12+1),
                                                        Text(snap.data[i]['title'],
                                                        style: TextStyle(fontSize: 16.0),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                    // Text('연남동 · 끌올 21초 전', style: TextStyle(fontSize: 13, color:Colors.grey[400], fontWeight: FontWeight.w500),),
                                                    // Text('25,000원', style: TextStyle(fontSize: 15, color:Colors.grey[800], fontWeight: FontWeight.w700),),
                                                    Text('${snap.data[i]["area"]} · ${snap.data[i]["updatetime"]}', style: TextStyle(fontSize: 13, color:Colors.grey[400], fontWeight: FontWeight.w500),),
                                                    Text('${snap.data[i]["price"]}', style: TextStyle(fontSize: 15, color:Colors.grey[800], fontWeight: FontWeight.w700),),
                                                  ],
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 4,
                                        child: 
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Icon(Icons.favorite_border, color: Colors.grey[400],),
                                              SizedBox(width:6),
                                              Text(snap.data[i]['favorite'].toString()),
                                              SizedBox(width:14),
                                              Icon(Icons.chat_bubble_outline, color: Colors.grey[400],),
                                              SizedBox(width:6),
                                              Text(snap.data[i]['chat'].toString()),
                                            ]
                                          ),
                                      )
                                    ]
                                  ),
                                ),
                                Divider(height:10),
                              ],
                            ),
                        )

                    ),
                ),

              );
          }
        ),        

      bottomNavigationBar: 
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300],
                width: 1,
              ),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: RawMaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () { 
                    widget._setPage(0);
                    if (widget._pageController.hasClients) { widget._pageController.animateToPage( 0, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut, ); }
                  }, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:4.0, horizontal:0),
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[ 
                        Icon(Icons.home, size:30, color:Colors.grey[900]), 
                        Text('홈', style:TextStyle(color:Colors.grey[900], fontSize: 13, letterSpacing: -0.2)), 
                      ], 
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () { 
                    widget._setPage(1);
                    if (widget._pageController.hasClients) { widget._pageController.animateToPage( 1, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut, ); }
                  }, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:4.0, horizontal:0),
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[ 
                        Icon(Icons.menu, size:30, color:Colors.grey[400]), 
                        Text('카테고리', style:TextStyle(color:Colors.grey[400], fontSize: 13, letterSpacing: -0.2)), 
                      ], 
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () { 
                    // widget._setPage(1);
                    // if (widget._pageController.hasClients) { widget._pageController.animateToPage( 1, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut, ); }
                  }, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:4.0, horizontal:0),
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[ 
                        Icon(Icons.border_color, size:30, color:Colors.grey[400]), 
                        Text('글쓰기', style:TextStyle(color:Colors.grey[400], fontSize: 13, letterSpacing: -0.2)), 
                      ], 
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () { 
                    widget._setPage(2);
                    if (widget._pageController.hasClients) { widget._pageController.animateToPage( 2, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut, ); }
                  }, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:4.0, horizontal:0),
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[ 
                        Icon(Icons.speaker_notes, size:30, color:Colors.grey[400]), 
                        Text('채팅', style:TextStyle(color:Colors.grey[400], fontSize: 13, letterSpacing: -0.2)), 
                      ], 
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RawMaterialButton(
                  onPressed: () { 
                    widget._setPage(3);
                    if (widget._pageController.hasClients) { widget._pageController.animateToPage( 3, duration: const Duration(milliseconds: 1), curve: Curves.easeInOut, ); }
                  }, 
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:4.0, horizontal:0),
                    child: Column( 
                      mainAxisSize: MainAxisSize.min, 
                      children: <Widget>[ 
                        Icon(Icons.person_outline, size:30, color:Colors.grey[400]), 
                        Text('나의 당근', style:TextStyle(color:Colors.grey[400], fontSize: 13, letterSpacing: -0.2)), 
                      ], 
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

    );

  }
}