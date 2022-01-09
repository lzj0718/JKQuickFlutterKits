import 'dart:ui';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jk_f_module/pages/page_placeholder.dart';
import 'package:jk_f_module/util/helper_native.dart';
import 'pages/page_tab_root.dart';
import 'dart:io';
import 'package:jk_f_module/util/helper_router.dart';
import 'package:jk_f_module/observer/observer_navigator.dart';

void main() {

  final String defaultRouteName = window.defaultRouteName;
  print("Flutter 初始化路由：$defaultRouteName");

  // if (Platform.isAndroid) {
  //   // 沉浸式状态栏
  //   SystemUiOverlayStyle style =
  //   SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(style);
  // }
  runApp(const JKApp());
}

class JKApp extends StatefulWidget {
  const JKApp({Key? key}) : super(key: key);

  @override
  _JKAppState createState() => _JKAppState();
}

class _JKAppState extends State<JKApp> {



  //判断是否初始化过路由
  bool _isInitConfigRoutes = false;

  //页面监听
  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();
  //自定义导航监听器
  static final JKNavigator jkNavigator = JKNavigator();

  Widget homeWidget = PlaceholderPage();

  @override
  Widget build(BuildContext context) {

    print("JKAppState build");

    if (!_isInitConfigRoutes) {
      _isInitConfigRoutes = true;
      // 配置路由
      Routes.configRoutes();
    }

    TargetPlatform platform = TargetPlatform.iOS;
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    }
    return MaterialApp(
      //页面监听
      navigatorObservers: [routeObserver,jkNavigator],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: RouteName.placeholder,
      onGenerateRoute: FluroRouter.appRouter.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: platform,
      ),
      home: homeWidget,
    );
  }

  @override
  void didUpdateWidget(covariant JKApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("JKAppState didUpdateWidget");
  }

  @override
  void initState() {
    super.initState();
    NativeTool.receiveMessage('route', _onEvent, onError: _onError);
  }

  void _onEvent(dynamic event) {
    print('JKAppState Native message:${event.toString()}');
    Widget current;
    String eventId = event.toString();
    current =  Routes.getWidgetByEventId(eventId) ?? PlaceholderPage();
    setState(() {
      homeWidget = current;
    });
  }

  void _onError(Object error) {
    print('JKAppState Native message error:$error');
  }
}
