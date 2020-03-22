import 'package:flutter/material.dart';
import 'loading.dart';
import 'home_root.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;
import 'package:flutter_store/flutter_store.dart';
import 'store.dart';

// import 'home_list.dart';
// import 'home_detail.dart';
// import 'cate.dart';
// import 'cate_list.dart';
// import 'cate_detail.dart';
// import 'chat.dart';
// import 'package:back_button_interceptor/back_button_interceptor.dart';

final _pager = Pager();

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/homeroot': (context) => HomeRoot(),
  },
  theme: ThemeData(primarySwatch: Colors.orange),
));

