import 'package:flutter/material.dart';
import 'native_tool.dart';
import 'package:jk_f_module/util/helper_router.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: (){
                  NativeTool.postMessage("naviToBack", {"animate":"1"});
                },
                child: Text('返回'),
              ),
              SizedBox(height: 50,),
              MaterialButton(
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
