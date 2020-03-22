import 'package:flutter/material.dart';

class CateDetail extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    Map<String,String> args = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      appBar: AppBar( // 상단바
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () { Navigator.pop(context); },
        ),
        // leading: Icon(Icons.arrow_back, color: Colors.black,),
        // title: Text('당근마켓', style: TextStyle( color:Colors.orange[800], fontWeight: FontWeight.w600),),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(Icons.file_upload, color: Colors.black,),
          SizedBox(width:8),
          Icon(Icons.more_vert, color: Colors.black,),
          SizedBox(width:12),
        ],
        elevation:0,
      ),

      body: SingleChildScrollView( // 메인
        child: Column(
          children: <Widget>[
            
            Hero( // 상품사진
              tag: args['tag'],
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(args['img']).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height:20),

            Padding( // 글쓴이
              padding: const EdgeInsets.symmetric( horizontal: 14.0 ),  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pug/2.png'),
                    radius: 24,
                  ),
                  SizedBox(width:12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('천사', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        Text('남구 대명동'),
                      ],
                    )
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text('38.4º', style: TextStyle(fontSize: 16, fontWeight:FontWeight.w600, color:Colors.orange[800])),
                          SizedBox(height:4),
                          Container(
                            height: 4,
                            width: 80.0, 
                            child: LinearProgressIndicator( 
                              backgroundColor: Colors.grey[400], 
                              value: 0.4,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange[700]),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width:8),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/pug/8.png'),
                        radius: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider( height: 40, ),

            Padding( // 상품설명
              padding: const EdgeInsets.symmetric( horizontal: 14.0 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('kf94마스크 대형 팝니다', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                  SizedBox(height:2),
                  Text('생활/가공식품 · 5시간 전', style: TextStyle(fontSize: 14, color:Colors.grey[600]),),
                  SizedBox(height:8),
                  Text('2,500원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                  SizedBox(height:20),
                  Text('장당 2500원 100장 미만으로 채팅 남겨주심됩니다\n***-****-****\n당근 마켓에서 거래 하신분들 많으세요\n적은 재고가 아니라서 많은 사람들이 주문 하다보니 퀵은 어렵구요ㅠㅠ직거래는 코로나 때문에 한사람 한사람 다 만나서 직거래 하기에는 너무 곤란해요 택배는 한번에 다 보낼 수 있는거라 양해 부탁드립니다', style: TextStyle(fontSize: 17), textAlign: TextAlign.justify, ),
                  SizedBox(height:16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('채팅 66 · 관심 35 · 조회 1313', style: TextStyle(fontSize: 14, color:Colors.grey[600]),),
                    ],
                  ),
                ],
              )
            ),
            Divider( height: 40, ),

            Padding( // 신고하기
              padding: const EdgeInsets.symmetric( horizontal: 14.0 ),                  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('이 게시글 신고하기', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                  Icon(Icons.chevron_right),
                ],
              ),
             ),
            Divider( height: 40, ),

            Padding( // 판매상품
              padding: const EdgeInsets.symmetric( vertical: 0.0, horizontal: 14.0 ),  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('석이네님의 판매 상품', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                  Text('모두보기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey[500]),),
                ],
              ),  
            ),
            SizedBox(height:32),
            Container(
              height: 220,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal:14),
                separatorBuilder: (context, index) { return SizedBox(width:10.0); },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) =>
                  Container(
                    child: Container(
                      width: 160.0,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset('assets/pug/7.png', fit: BoxFit.cover, width:160, height: 150,),
                          ),
                          SizedBox(height:16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('과학자들이 들려주는 이야기 이야기',
                                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text('25,000원', style: TextStyle(fontSize: 15, color:Colors.grey[800], fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height:36),

            Padding( // 추천상품
              padding: const EdgeInsets.symmetric( vertical: 0.0, horizontal: 14.0 ),  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('스노우님, 이건 어때요?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
                  // Text('모두보기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey[500]),),
                ],
              ),  
            ),
            SizedBox(height:32),
            Container(
              height: 220,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal:14),
                separatorBuilder: (context, index) { return SizedBox(width:10.0); },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) =>
                  Container(
                    child: Container(
                      width: 160.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset('assets/pug/8.png', fit: BoxFit.cover, width:160, height: 150,),
                          ),
                          SizedBox(height:16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('팔과 다리의 가격',
                                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text('25,000원', style: TextStyle(fontSize: 15, color:Colors.grey[800], fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height:32),            
                     
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar( // 하단바
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[300],
                width: 1,
              ),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0, vertical:4.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.favorite_border, color: Colors.grey[500],),
                SizedBox(width:14),
                Container(
                  width: 1,
                  height: 24,
                  color: Colors.grey[300],
                ),
                SizedBox(width:16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('25,000원', style: TextStyle(fontSize:17, color:Colors.black, fontWeight: FontWeight.w600),),
                        Text('가격제안 불가', style: TextStyle(fontSize:12, color:Colors.grey[600], fontWeight: FontWeight.w600, letterSpacing: -0.1 ),),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  elevation: 0,
                  child: Text('채팅으로 거래하기', style: TextStyle(color:Colors.white, fontWeight: FontWeight.w600),),
                  color: Colors.orange[700],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}