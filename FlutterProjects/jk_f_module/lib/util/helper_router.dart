import 'helper_tool.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'helper_toast.dart';
import 'dart:convert' as convert;
import 'package:jk_f_module/extension/jk_extension_string.dart';
import 'package:jk_f_module/pages/page_tab_root.dart';
import 'package:jk_f_module/pages/page_tab_home.dart';
import 'package:jk_f_module/pages/page_tab_message.dart';
import 'package:jk_f_module/pages/page_tab_usercenter.dart';
import 'package:jk_f_module/pages/page_register.dart';
import 'package:jk_f_module/pages/page_tab_home.dart';
import 'package:jk_f_module/pages/page_test_channel.dart';

typedef _CallBack = void Function(dynamic result);

class RouterUtil {
  //路由参数
  static const String _param = 'router_param';

  // MARK 跳转到指定页面
  static push(BuildContext context, String url,
      {Map? params,
        bool replace = false,
        bool clearStack = false,
        TransitionType transType = TransitionType.inFromRight,
        _CallBack? block}) {
    //有参数
    if (params != null) {
      url += RouterUtil.setRouterParams(params);
    }

    FluroRouter.appRouter.navigateTo(
      context,
      url,
      transition: transType,
      replace: replace,
      clearStack: clearStack,
    )..then((value) {
      if (block != null) {
        block(value);
      }
    });
  }

  // MARK 返回页面
  static pop(BuildContext context, {dynamic params, bool root = false}) {
    //返回上一页
    Navigator.maybePop(context, params);
  }

  // MARK 返回跟页面
  static popRoot(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(RouteName.root));
  }

  // MARK 是否可以返回
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  // MARK 处理入参
  static String setRouterParams(dynamic params) {
    //无参数
    if (null == params) {
      return '';
    }
    if (params is Map) {
      //转json
      params = convert.jsonEncode(params);
    }
    //断言
    assert((params is String), '参数类型不正确 参数格式只能是 Json 或 Map');
    String str = params;
    //编码中文
    str = str.toCoding();
    //拼接参数
    return '?' + _param + '=$str';
  }

  // MARK 处理出参
  static Map getRouterParams(Map params) {
    if (params.length == 0) {
      return {};
    }
    Map temp = {};

    //获取内容
    String value = params[_param].first;
    //解码中文
    value = value.toDeCoding();
    //转map
    temp = convert.jsonDecode(value);

    return temp;
  }
}

// MARK 路由名
class RouteName {
  // 跟目录
  static String root = '/';
  // F主页
  static String home = '/home';
  // F消息
  static String message = '/message';
  // F个人中心
  static String usercenter = '/usercenter';
  // 注册页面
  static String reg = '/reg';
  // 测试消息通道
  static String test_channel = '/test_channel';
}

// MARK 路由设置
class Routes {

  // MARK 配置routes
  static void configRoutes() {
    var router = FluroRouter.appRouter;
    router.notFoundHandler =
        Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> parameters) {
          showToast("没有找到相关路由 !");
          return null;
        });

    // 注册路由
    _getRoutList().forEach((url, func) {
      router.define(url, handler: Handler(handlerFunc: func));
    });
  }

  // MARK 路由列表
  static Map _getRoutList() {
    return {
      RouteName.root: (context, params) {
        return TabRootPage();
      },
      RouteName.home: (context, params) => TabHomePage(),
      RouteName.message: (context, params) => TabMessagePage(),
      RouteName.usercenter: (context, params) => TabUserCenterPage(),
      RouteName.reg: (context, params) {
        Map param = RouterUtil.getRouterParams(params);
        return RegisterPage(
          param: param,
        );
      },
    };
  }

  //通过事件ID返回widget
  static Widget? getWidgetByEventId(String eventId) {
    Widget? current;
    if (eventId.startsWith(RouteName.test_channel)) {
      current = TestChannelPage(key:Key(eventId));
    }else if (eventId.startsWith(RouteName.root)) {
      current = TabRootPage(key:Key(eventId));
    }else if (eventId.startsWith(RouteName.home)) {
      current = TabHomePage(key:Key(eventId));
    }else if (eventId.startsWith(RouteName.message)) {
      current = TabMessagePage(key:Key(eventId));
    }else if (eventId.startsWith(RouteName.usercenter)) {
      current = TabUserCenterPage(key:Key(eventId));
    }
    return current;
  }

}