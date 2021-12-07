import 'package:flutter/material.dart';
import 'placeholder_page.dart';
import 'test_channel_page.dart';
import 'test_image_page.dart';
import 'native_tool.dart';

void main() => runApp(const JKApp());

class JKApp extends StatefulWidget {
  const JKApp({Key? key}) : super(key: key);

  @override
  _JKAppState createState() => _JKAppState();
}

class _JKAppState extends State<JKApp> {

  Widget homeWidget = PlaceholderPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
    switch (event.toString()) {
      case "test_channel_page":
        current = TestChannelPage();
        break;
      case "test_image_page":
        current = TestImagePage();
        break;
      default:
        current = PlaceholderPage();
    }

    setState(() {
      homeWidget = current;
    });
  }

  void _onError(Object error) {
    print('JKAppState Native message error:$error');
  }
}
