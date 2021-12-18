import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page_tab_home.dart';
import 'page_tab_message.dart';
import 'page_tab_usercenter.dart';

class TabRootPage extends StatefulWidget {
  const TabRootPage({Key? key}) : super(key: key);

  @override
  _TabRootPageState createState() => _TabRootPageState();
}

class _TabRootPageState extends State<TabRootPage> {

  int _currentIndex = 0;
  List<Widget> pages = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages.addAll([
      TabHomePage(),
      TabMessagePage(),
      TabUserCenterPage(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        border: Border(top: BorderSide(width: 1,color:Colors.grey[200]! ) ),
        backgroundColor: Colors.white,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: "F首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30,
            ),
            label: "F消息",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: 30,
            ),
            label: "F中心",
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int i){
          setState(() {
            _currentIndex = i;
          });
        } ,
      ),
      body: pages[_currentIndex],
    );
  }
}
