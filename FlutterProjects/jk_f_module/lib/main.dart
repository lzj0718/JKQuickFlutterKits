import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jk_f_module/pages/page_placeholder.dart';
import 'package:jk_f_module/util/helper_native.dart';
import 'pages/page_tab_root.dart';
import 'dart:io';
import 'package:jk_f_module/util/helper_router.dart';

void main() {

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

  //页面监听
  static final RouteObserver<PageRoute> routeObserver =
  RouteObserver<PageRoute>();

  Widget homeWidget = PlaceholderPage();

  @override
  Widget build(BuildContext context) {

    // 配置路由
    Routes.configRoutes();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // initialRoute: RouteName.root,
      onGenerateRoute: FluroRouter.appRouter.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homeWidget,
    );
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
    current =  Routes.getWidgetByEventId(eventId) ?? PlaceholderPage(key: Key(eventId));
    setState(() {
      homeWidget = current;
    });
  }

  void _onError(Object error) {
    print('JKAppState Native message error:$error');
  }
}
