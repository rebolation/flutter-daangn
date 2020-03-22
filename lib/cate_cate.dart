import 'package:flutter/material.dart';
import 'cate_list.dart';
import 'cate_detail.dart';


class CateCate extends StatefulWidget {

  PageController _pageController;
  Function _setPage;
  Function _setIsRoot;
  CateCate(this._pageController, this._setPage, this._setIsRoot);

  @override
  _CateCateState createState() => _CateCateState();
}

class _CateCateState extends State<CateCate> {

  List<Map> _serviceList = [
    {'title':'클래스'},
    {'title':'속눈썹'},
    {'title':'이사'},
    {'title':'용달'},
    {'title':'인테리어'},
    {'title':'네일'},
    {'title':'카페'},
    {'title':'사다리차'},
    {'title':'공방'},
  ];

  List<Map> _goodsList = [
    {'icon':'13.PNG', 'title':'인기매물'},
    {'icon':'1.PNG', 'title':'디지털/가전'},
    {'icon':'2.PNG', 'title':'가구/인테리어'},
    {'icon':'3.PNG', 'title':'유아동/유아도서'},
    {'icon':'4.PNG', 'title':'생활/가공식품'},
    {'icon':'5.PNG', 'title':'여성의류'},
    {'icon':'6.PNG', 'title':'여성잡화'},
    {'icon':'7.PNG', 'title':'뷰티/미용'},
    {'icon':'8.PNG', 'title':'남성패션/잡화'},
    {'icon':'9.PNG', 'title':'스포츠/레저'},
    {'icon':'10.PNG', 'title':'게임/취미'},
    {'icon':'11.PNG', 'title':'도서/티켓/음반'},
    {'icon':'12.PNG', 'title':'반려동물용품'},
    {'icon':'13.PNG', 'title':'기타 중고물품'},
    {'icon':'14.PNG', 'title':'삽니다'},
  ];

  List<Map> _adList = [
    {'icon':'5.PNG','title':'중고차/오토바이'},
    {'icon':'6.PNG','title':'동네 구인구직'},
    {'icon':'7.PNG','title':'부동산'},
    {'icon':'8.PNG','title':'농수산물'},
    {'icon':'9.PNG','title':'지역업체 소개'},
    {'icon':'10.PNG','title':'과외/클래스 모집'},
    {'icon':'11.PNG','title':'전시/공연/행사'},
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
              Text('카테고리', style: TextStyle( color:Colors.grey[900], fontSize:18, fontWeight: FontWeight.w800),),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Icon(Icons.search, color: Colors.black,),
            SizedBox(width:16),
            Icon(Icons.notifications_none, color: Colors.black,),
            SizedBox(width:12),
          ],
        ),

      body: 
        SingleChildScrollView(
          key: PageStorageKey('catecate'), // save scroll position
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Container( // 우리동네 서비스
                  padding: EdgeInsets.symmetric(horizontal:16),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey[300],
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:22),
                      Text('우리동네 서비스', style:TextStyle(fontSize: 15, fontWeight: FontWeight.w800) ),
                      SizedBox(height:4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 0.0, // gap between lines
                          children: _serviceList.map((service) {
                            return MaterialButton( onPressed: () async { 
                              widget._setIsRoot(false);
                                final returned = await 
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => CateList(widget._pageController, widget._setPage, widget._setIsRoot),
                                  )
                                );
                              widget._setIsRoot(true); // 뒤로가기 누르면 홈으로 이동...

                            }, minWidth: 0.0, shape: StadiumBorder(side: BorderSide(color: Colors.grey[300], width: 1)), child: Text(service['title']), );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height:4),
                    ],
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 5.0, // has the effect of softening the shadow
                        spreadRadius: 0.0, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          1.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: MaterialButton(
                    height: 50.0,
                    minWidth: double.infinity,
                    onPressed: () {}, 
                    child: Text('우리동네 서비스 더 찾아보기', style:TextStyle(color:Color.fromRGBO(0, 120, 150, 1), fontSize: 15, fontWeight: FontWeight.w800)),
                  ),
                ),

                SizedBox(height:10),

                Container( // 중고거래
                  padding: EdgeInsets.symmetric(horizontal:16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:22),
                      Text('중고거래', style:TextStyle(fontSize: 15, fontWeight: FontWeight.w800) ),
                      SizedBox(height:22),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _goodsList.map((goods) {
                      return
                        MaterialButton(
                          onPressed: () {}, 
                          height: 50.0, minWidth: double.infinity,
                          child: Align(alignment: Alignment.centerLeft, child: Row( children: <Widget>[ Image.asset('assets/cate/'+goods['icon'], width: 40,), SizedBox(width:12), Text(goods['title'], style:TextStyle(color:Colors.grey[700], fontSize: 15)), ], ) ),
                        );
                    }).toList(),                    
                  ),
                ),
                      
                Container( // 구분선
                  padding: const EdgeInsets.symmetric(horizontal:14.0),
                  color: Colors.white,
                  child: Divider(height:1),
                ),

                Container( // 동네홍보
                  padding: EdgeInsets.symmetric(horizontal:16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height:22),
                      Text('동네홍보', style:TextStyle(fontSize: 15, fontWeight: FontWeight.w800) ),
                      SizedBox(height:22),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _adList.map((ad) {
                      return 
                        MaterialButton(
                          onPressed: () {}, 
                          height: 50.0, minWidth: double.infinity,
                          child: Align(alignment: Alignment.centerLeft, child: Row( children: <Widget>[ Image.asset('assets/cate/'+ad['icon'], width: 40,), SizedBox(width:12), Text(ad['title'], style:TextStyle(color:Colors.grey[700], fontSize: 15)), ], ) ),
                        );
                    }).toList(),
                  ),
                ),

                SizedBox(height:10),

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
                        Icon(Icons.menu, size:30, color:Colors.grey[900]), 
                        Text('카테고리', style:TextStyle(color:Colors.grey[900], fontSize: 13, letterSpacing: -0.2)), 
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