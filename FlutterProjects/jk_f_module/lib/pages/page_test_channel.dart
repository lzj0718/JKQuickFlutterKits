import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jk_f_module/util/helper_native.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class TestChannelPage extends StatefulWidget {

  const TestChannelPage({Key? key}) : super(key: key);

  @override
  _TestChannelPageState createState() => _TestChannelPageState();
}

class _TestChannelPageState extends State<TestChannelPage> {

  int _hitNum = 0;
  int _time = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('TestChannelPageState dispose');
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('TestChannelPageState deactivate');
  }

  @override
  void initState() {
    super.initState();
    print('TestChannelPageState initState');
    // NativeTool.receiveMessage('time', _onEvent, onError: _onError);
  }
  void _onEvent(dynamic event) {
    print('TestChannelPageState Native message:${event.toString()}');
  }

  void _onError(Object error) {
    print('TestChannelPageState Native message error:$error');
  }

  Future<void> _hitEvent() async{
    var hitNum;
    try {
      final int result = await NativeTool.postMessage("hitCount");
      hitNum = result;
    } on PlatformException {
    }
    if (hitNum !=null) {
      setState(() {
        _hitNum = hitNum;
      });
    }
    getHttp();
  }
  void getHttp() async {
    try {
      var response = await Dio().get('https://www.baidu.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: _ContentWidget(),
    );
  }

  Column _ContentWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("当前点击次数：$_hitNum", key: const Key('hitEvent')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('hit'),
                onPressed: _hitEvent,
              ),
            ),
          ],
        ),
       Text("计时器时间${_time}s"),
      ],
    );
  }
}
