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
    String eventId = event.toString();
    if (eventId.startsWith("test_channel_page")) {
      current = TestChannelPage(key:Key(eventId));
    }else if (eventId.startsWith("test_image_page")) {
      current = TestImagePage(key:Key(eventId));
    }else{
      current = PlaceholderPage(key:Key(eventId));
    }
    setState(() {
      homeWidget = current;
    });
  }

  void _onError(Object error) {
    print('JKAppState Native message error:$error');
  }
}
