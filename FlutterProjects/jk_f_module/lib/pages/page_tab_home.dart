import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jk_f_module/widgets/widget_appbar.dart';
import 'package:jk_f_module/util/helper_router.dart';
import 'package:jk_f_module/util/helper_toast.dart';
import 'package:jk_f_module/util/helper_tool.dart';
class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: '自定义导航栏',
        rightActions: [
          Image(
              image: AssetImage(Tool.getImage('nav_star')),
              width:30.0,
              height:30.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                borderRadius: BorderRadius.circular(0),
                pressedOpacity: 0.8,
                color: Colors.blue,
                minSize: 0,
                child: Container(
                  width: 90,
                  height: 35,
                  alignment: Alignment.center,
                  child: Text(
                    '注册页',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () {
                  RouterUtil.push(
                    context,
                    RouteName.reg,
                    params: {
                      'param': '1234',
                      'title': '标题',
                    },
                    block: ((value) {
                      if (value != null) {
                        showToast(value);
                      }
                    }),
                  );
                },
              ),
              // FlatButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('导航栏'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.nav);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('布局'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.layout);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('动画'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.animated);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('列悬浮'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.columnList);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('行悬浮'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.rowList);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('自定义标签页'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.table);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('分页'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.paging);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('界面周期'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.cycle);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('请求'),
              //   onPressed: () {
              //     Interface.homeList()
              //       ..then((DataModel value) {
              //         if (value.data != null) {
              //           showToast('收到数据');
              //         }
              //       });
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('加载'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.load);
              //   },
              // ),
              // MaterialButton(
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   child: Text('存储'),
              //   onPressed: () {
              //     RouterUtil.push(context, RouteName.storage);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
