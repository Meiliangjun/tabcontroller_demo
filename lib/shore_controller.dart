import 'package:flutter/material.dart';

class ShoreController extends StatelessWidget {
  const ShoreController({Key key}) : super(key: key);

  void _handleChat() {
    print("点击联系客服按钮");
  }

  void _handleEventNote() {
    print("点击制作按钮");
  }

  void _handleListRowTouch(int index) {
    print("获取到list view的点击行数$index");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return Text('What can I do for you?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));

    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Text('What can I do for you?', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
                subtitle: Text("Just testing!"),
                onTap: () => _handleListRowTouch(index),
              );
            },
            itemCount: 32,
          ),
          Positioned(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _handleChat,
                  child: Icon(Icons.audiotrack),
                ),
                GestureDetector(
                  onTap: _handleEventNote,
                  child: Icon(Icons.event_note),
                ),
              ],
            ),
            bottom: 20,
            right: 20,
          ),
        ],
      ),
    );
  }
}
