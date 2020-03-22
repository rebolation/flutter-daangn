import 'package:flutter/material.dart';
import 'package:flutter_store/flutter_store.dart';

class Pager extends Store {
  int _currentPage; // 페이지뷰 현재페이지 (for 뒤로가기 인터셉터)
  bool _isRoot = true; // 현재화면이 최상단 목록일때만 뒤로가기 인터셉트  
  List _prodlist = [];

  get currentPage => _currentPage;
  get isRoot => _isRoot;
  get prodlist => _prodlist;

  void setCurrentPage(int i) {
    setState((){
      _currentPage = i;
    });
  }

}