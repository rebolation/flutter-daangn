import 'package:flutter/material.dart';
import 'chat_detail.dart';

class ChatList extends StatefulWidget {

  PageController _pageController;
  Function _setPage;
  Function _setIsRoot;
  ChatList(this._pageController, this._setPage, this._setIsRoot);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: 
        AppBar( // 상단바
          automaticallyImplyLeading: false,
          elevation: 1,
          title: Row(
            children: <Widget>[
              Text('채팅', style: TextStyle( color:Colors.grey[900], fontSize:18, fontWeight: FontWeight.w800),),
            ],
          ),
          backgroundColor: Colors.white,
        ),

      body: 
        ListView.separated(
          key: PageStorageKey('chatlist'), // save scroll position
          separatorBuilder: (context, index) { return Divider(height:0.0); },
          scrollDirection: Axis.vertical,
          itemCount: 11,
          itemBuilder: (BuildContext context, int i) =>

            ListTile(
              onTap: () async {
                widget._setIsRoot(false);
                final returned = await 
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ChatDetail(),
                      settings: RouteSettings(arguments: 
                        {
                          'tag': 'hero_home' + (i+1).toString(),
                          'img': 'assets/pug/'+ (i+1).toString() +'.png',
                        }
                      ),
                    )
                  );
                widget._setIsRoot(true);
              },
              title: 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/pug/'+(i+1).toString()+'.png'),
                        radius:28,
                      ),
                      SizedBox(width:16),
                      Expanded(
                        child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                                child: 
                                  RichText(text: TextSpan(
                                    text: '당근만세' + '~'*i,
                                    style: TextStyle( color:Colors.grey[900], fontSize:14, fontWeight: FontWeight.w800),
                                    children: <TextSpan>[
                                      TextSpan(text: '  은평구 응암동', style: TextStyle( color:Colors.grey[600], fontSize:14, fontWeight: FontWeight.w300)),
                                      TextSpan(text: ' · 1월 15일', style: TextStyle( color:Colors.grey[600], fontSize:14, fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  ),
                              ),
                              SizedBox(height:4),
                              Text('아하 네'+('!!'*(i+1))),
                            ],
                          ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset('assets/pug/'+(10-i).toString()+'.png', fit: BoxFit.cover, width:50, height: 50,),
                      ),
                    ],
                  ),
                ),
            )
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
                        Icon(Icons.speaker_notes, size:30, color:Colors.grey[900]), 
                        Text('채팅', style:TextStyle(color:Colors.grey[900], fontSize: 13, letterSpacing: -0.2)), 
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