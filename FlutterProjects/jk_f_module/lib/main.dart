import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _hitNum = 0;
  int _time = 0;
  //flutter 调用 原生


  static const MethodChannel methodChannel =
  MethodChannel('tech.1126.flutter/count');
  //原生 调用 flutter
  static const EventChannel eventChannel =
  EventChannel('tech.1126.flutter/time');


  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }
  
  void _onEvent(dynamic event) {
    setState(() {
      print("{$event}");
      // _time = "Battery status: ${event}";
    });
  }

  void _onError(Object error) {
    setState(() {
      print("{$error}");
      // _time = 'Battery status: unknown.';
    });
  }

  Future<void> _hitEvent() async{
    var hitNum;
    try {
      final int result = await methodChannel.invokeMethod('hitCount');
      hitNum = result;
    } on PlatformException {
    }
    if (hitNum !=null) {
      setState(() {
        _hitNum = hitNum;
      });
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
