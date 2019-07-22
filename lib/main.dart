import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'NoSplash.dart';
import 'account_controller.dart';
import 'home_controller.dart';
import 'alert_controller.dart';
import 'shore_controller.dart';
import 'knowledge_controller.dart';

void main() => runApp(TabBarDemo());


class TabBarDemo extends StatelessWidget {

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // title: _title,
      home: MyStatefulWidget(),
      );
  }
  
}


class MyStatefulWidget extends StatefulWidget {
  
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
//    Text('Welcome home page!', style: optionStyle),
    HomePage(),
    FeedbackController(),
    KnowledgeController(),
    ShoreController(),
    AccountControllerView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
//      appBar: AppBar(
//        title: const Text('BottomNavigationBar Simple'),
//        ),
      body: Center(
//        child: Padding(padding: EdgeInsets.all(0), child: _widgetOptions.elementAt(_selectedIndex)),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert),
              title: Text('反馈')
            ),
          BottomNavigationBarItem(icon: Icon(Icons.markunread)),
          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              title: Text('商城')
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('我的')
            ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        ),
      );
  }
  
}




