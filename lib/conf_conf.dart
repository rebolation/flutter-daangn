import 'package:flutter/material.dart';
import 'home_detail.dart';


class ConfConf extends StatefulWidget {

  PageController _pageController;
  Function _setPage;
  Function _setIsRoot;
  ConfConf(this._pageController, this._setPage, this._setIsRoot);

  @override
  _ConfConfState createState() => _ConfConfState();
}

class _ConfConfState extends State<ConfConf> {

  List<Map> _menuList1 = [
    {'icon':'1.PNG', 'title':'내 동네 설정'},
    {'icon':'2.PNG', 'title':'동네 인증하기'},
    {'icon':'3.PNG', 'title':'키워드 알림'},
    {'icon':'4.PNG', 'title':'모아보기'},
  ];

  List<Map> _menuList2 = [
    {'icon':'1.PNG', 'title':'친구초대'},
    {'icon':'2.PNG', 'title':'당근마켓 공유'},
    {'icon':'3.PNG', 'title':'공지사항'},
    {'icon':'4.PNG', 'title':'고객센터'},
    {'icon':'5.PNG', 'title':'앱 설정'},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: 
        AppBar( // 상단바
          elevation: 1,
          title: Row(
            children: <Widget>[
              Text('나의 당근', style: TextStyle( color:Colors.grey[900], fontSize:18, fontWeight: FontWeight.w800),),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Icon(Icons.settings, color: Colors.black,),
            SizedBox(width:12),
          ],
        ),

      body: 
        SingleChildScrollView(
          key: PageStorageKey('confconf'), // save scroll position
          child:
            Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal:14, vertical: 24),
                  child:
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/pug/1.png'),
                          radius:30,
                        ),
                        SizedBox(width:16),
                        Expanded(
                          child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('당그', style:TextStyle(color:Colors.grey[800], fontSize: 18, fontWeight: FontWeight.w800)),
                                SizedBox(height:4),
                                Text('연남동'),
                              ],
                            ),
                        ),
                        OutlineButton(
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(6.0)),
                          child: Align(alignment: Alignment.centerLeft, child: Text('프로필 보기', style:TextStyle(color:Colors.grey[800], fontSize: 14, fontWeight: FontWeight.w800)), ),
                        )
                      ],
                    ),
                ),
                SizedBox(height:1),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal:14, vertical: 26),
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CircleAvatar( backgroundImage: AssetImage('assets/conf1.PNG'), radius:30, ),
                            Text('판매내역')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar( backgroundImage: AssetImage('assets/conf1.PNG'), radius:30, ),
                            Text('구매내역')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CircleAvatar( backgroundImage: AssetImage('assets/conf1.PNG'), radius:30, ),
                            Text('관심목록')
                          ],
                        ),

                      ],
                    ),
                ),
                SizedBox(height:8),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical:8.0, horizontal:0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _menuList1.map((goods) {
                      return 
                        MaterialButton(
                          onPressed: () {},
                          height: 50.0, minWidth: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical:14.0, horizontal:8.0),
                            child: Align(alignment: Alignment.centerLeft, child: Row( children: <Widget>[ Image.asset('assets/cate/'+goods['icon'], width: 40,), SizedBox(width:12), Text(goods['title'], style:TextStyle(color:Colors.grey[700], fontSize: 15)), ], ) ),
                          ),
                        );
                    }).toList(),                    
                  ),
                ),
                SizedBox(height:8),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical:8.0, horizontal:0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _menuList2.map((goods) {
                      return 
                        MaterialButton(
                          onPressed: () {}, 
                          height: 50.0, minWidth: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical:14.0, horizontal:8.0),
                            child: Align(alignment: Alignment.centerLeft, child: Row( children: <Widget>[ Image.asset('assets/cate/'+goods['icon'], width: 40,), SizedBox(width:12), Text(goods['title'], style:TextStyle(color:Colors.grey[700], fontSize: 15)), ], ) ),
                          ),
                        );
                    }).toList(),                    
                  ),
                ),
              ],
            ),
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
                        Icon(Icons.home, size:30, color:Colors.grey[400]), 
                        Text('홈', style:TextStyle(color:Colors.grey[400], fontSize: 13, letterSpacing: -0.2)), 
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
                        Icon(Icons.person_outline, size:30, color:Colors.grey[900]), 
                        Text('나의 당근', style:TextStyle(color:Colors.grey[900], fontSize: 13, letterSpacing: -0.2)), 
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