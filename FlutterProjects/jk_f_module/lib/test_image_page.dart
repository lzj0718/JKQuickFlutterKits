import 'package:flutter/material.dart';
import 'native_tool.dart';

class TestImagePage extends StatelessWidget {
  const TestImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Center(
        child:  Column(
          children:<Widget>[
            Text('图片测试页面'),
          ],
        ),
      ),
    ) ;
  }
}
