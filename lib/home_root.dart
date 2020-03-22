import 'package:flutter/material.dart';
import 'home_list.dart';
import 'cate_cate.dart';
import 'chat_list.dart';
import 'conf_conf.dart';
import 'package:path/path.dart';
import 'store.dart';

import 'package:back_button_interceptor/back_button_interceptor.dart';


/*
  홈 - 뒤로가기 - 종료
  홈 - 상세보기 - 뒤로가기 - 홈
  홈 - 카테고리 - 뒤로가기 - 홈
  홈 - 카테고리 - 삽니다 - 뒤로가기 - 카테고리 - 뒤로가기 - 홈
  홈 - 카테고리 - 채팅 - 뒤로가기 - 홈
  홈 - 카테고리 - 채팅 - 상세보기 - 뒤로가기 - 채팅 - 뒤로가기 - 홈
  홈 - 나의 당근 - 내 동네 설정 - 뒤로가기 - 나의 당근 - 뒤로가기 - 홈
  홈 - 검색 - 결과목록 - 상세보기 - 뒤로가기 - 결과목록 - 뒤로가기 - 홈
*/

class HomeRoot extends StatefulWidget {
  HomeRoot({Key key}) : super(key: key);

  _HomeRootState createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {

  PageController _pageController; // 페이지뷰 컨트롤러

  int _currentPage; // 페이지뷰 현재페이지 (for 뒤로가기 인터셉터)
  bool _isRoot = true; // 현재화면이 최상단 목록일때만 뒤로가기 인터셉트

  bool myInterceptor(bool stopDefaultButtonEvent) { // 뒤로가기 인터셉터

    if(_currentPage == 0) { // 홈에서 뒤로가기 => 종료
      return false;
    }

    if(_currentPage != 0 && _isRoot) { // 카테고리, 글쓰기, 채팅, 나의 당근에서 뒤로가기 => 홈
      setState(() {
        _currentPage = 0;
      });
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
      return true;
    }

    if(_isRoot == false) {
      return false; // 뒤로가기
    }

  }

  void setPage(int currentPage) { // 페이지뷰 내에서 하단바를 통해 페이지 이동 시 (for 뒤로가기 인터셉터)
    setState(() {
      _currentPage = currentPage;
    });
  }

  void setIsRoot(bool isRoot) {
    setState(() {
      _isRoot = isRoot;
    });
  }


  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    _pageController.dispose();
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
      // MaterialApp(
        // debugShowCheckedModeBanner: false,
        // home: 
          Scaffold(
            body: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeList(_pageController, setPage, setIsRoot),
                CateCate(_pageController, setPage, setIsRoot),
                ChatList(_pageController, setPage, setIsRoot),
                ConfConf(_pageController, setPage, setIsRoot),
              ],
            ),
          );
      // );
  }
}




/*


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyPageView()
));


class MyPageView extends StatefulWidget {
  MyPageView({Key key}) : super(key: key);

  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            Container(
              color: Colors.red,
              child: Center(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text('Previous'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/