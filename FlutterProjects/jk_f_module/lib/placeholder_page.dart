import 'package:flutter/material.dart';
import 'native_tool.dart';

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
          child: MaterialButton(
            onPressed: (){
              NativeTool.postMessage("naviToBack", {"animate":"1"});
            },
            child: Text('返回'),
          ),
        ),
      ),
    );
  }
}
