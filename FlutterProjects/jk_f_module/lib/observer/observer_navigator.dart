import 'package:flutter/material.dart';
import 'package:jk_f_module/util/helper_router.dart';

class JKNavigator extends NavigatorObserver {

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    String previousName = previousRoute?.settings.name ?? 'null';
    print('JKNavigator DidPop Current：${route.settings.name} Previous:${previousName}');
    bool canPop = navigator?.canPop() ?? false;
    if (canPop) {
      RouterUtil.disableNativePopGestureRecognizer();
    }else{
      RouterUtil.enableNativePopGestureRecognizer();
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    String previousName = previousRoute?.settings.name ?? 'null';
    print('JKNavigator DidPush Current：${route.settings.name} Previous:${previousName}');
    if (previousRoute == null) {
      RouterUtil.enableNativePopGestureRecognizer();
    }else{
      RouterUtil.disableNativePopGestureRecognizer();
    }
  }

}