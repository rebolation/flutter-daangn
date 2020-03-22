import 'package:flutter/material.dart';
import 'cate_detail.dart';


class CateList extends StatefulWidget {

  PageController _pageController;
  Function _setPage;
  Function _setIsRoot;
  CateList(this._pageController, this._setPage, this._setIsRoot);

  @override
  _CateListState createState() => _CateListState();
}

class _CateListState extends State<CateList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: 
        AppBar( // 상단바
          automaticallyImplyLeading: false,
          elevation: 1,
          title: Row(
            children: <Widget>[
              Text('연남동 근처 클래스', style: TextStyle( color:Colors.grey[800], fontSize:16, fontWeight: FontWeight.w600),),
              Icon(Icons.keyboard_arrow_down, color:Colors.grey[800]),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Icon(Icons.search, color: Colors.black,),
            SizedBox(width:8),
            Icon(Icons.tune, color: Colors.black,),
            SizedBox(width:8),
            Icon(Icons.notifications_none, color: Colors.black,),
            SizedBox(width:12),
          ],
        ),

      body: 
        ListView.separated(
          key: PageStorageKey('page2'), // save scroll position
          separatorBuilder: (context, index) { return Divider(height:0.0); },
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (BuildContext context, int i) =>

            ListTile(
              onTap: () async {
                widget._setIsRoot(false);
                final returned = await 
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CateDetail(),
                      settings: RouteSettings(arguments: 
                        {
                          'tag': 'hero_cate' + (i+6).toString(),
                          'img': 'assets/pug/'+ (i+6).toString() +'.png',
                        }
                      ),
                    )
                  );
                widget._setIsRoot(false); // 뒤로가기 누르면 카테고리메인으로 이동
              },

              title: 
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        child:
                        Hero(
                          tag: 'hero_cate' + (i+6).toString(),
                          child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('assets/pug/'+(i+6).toString()+'.png', fit: BoxFit.cover, width:120, height: 120,),
                            ),
                        ),
                      ),
                      SizedBox(width:16),
                      Expanded(
                        child: Container(
                          height: 120,
                          child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('카테고리 '*(i+1),
                                        style: TextStyle(fontSize: 17.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Text('연남동 · 끌올 21초 전', style: TextStyle(fontSize: 14, color:Colors.grey[400], fontWeight: FontWeight.w500),),
                                    Text('25,000원', style: TextStyle(fontSize: 16, color:Colors.grey[800], fontWeight: FontWeight.w700),),
                                  ]                                  
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(Icons.favorite_border, color: Colors.grey[400],),
                                    SizedBox(width:8),
                                    Text('1'),
                                  ]
                                ),
                              ]
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
            )
        ),

    );

  }
}