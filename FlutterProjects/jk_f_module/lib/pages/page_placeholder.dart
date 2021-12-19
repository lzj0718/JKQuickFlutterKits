import 'package:flutter/material.dart';
import 'package:jk_f_module/util/helper_native.dart';
import 'package:jk_f_module/util/helper_router.dart';
import 'package:jk_f_module/util/helper_router.dart';
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("默认界面"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(
                "默认未识别路由占位页面",
                  style:TextStyle(
                    color: Colors.red,
                    fontSize: 30.0,
                  ),
              ),
              SizedBox(height: 50,),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: (){
                  RouterUtil.popToNative(context);
                },
                child: Text('返回原生界面'),
              ),
              SizedBox(height: 50,),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: (){
                  RouterUtil.push(
                    context,
                    RouteName.root
                  );
                },
                child: Text('去Flutter首页'),
              ),
            ],
          )
        ),
      ),
    );
  }
}
