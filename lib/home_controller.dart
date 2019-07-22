import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  void _handleChat() {
    print("点击联系客服按钮");
  }

  void _handleEventNote() {
    print("点击制作按钮");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            JM_SearchBar(),
            AccountInfo(),
            PersonDailyPlan(),
            IntellectualExercise(),
            ViewMyPackageButton(),
          ],
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
    );
  }
}

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              'images/girls/girl_01.jpg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              children: <Widget>[
                Text(
                  'Your name',
                  style: TextStyle(fontSize: 26, color: Colors.white70),
                ),
                Text(
                  'Your detail info',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.black87,
      height: 130.0,
    );
  }
}

class PersonDailyPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Center(
          child: Text("Your person daily paln."),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0)
            ]),
      ),
      color: Color(0xfff0f0f0),
      padding: EdgeInsets.all(10),
      height: 200,
    );
  }
}

class IntellectualExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 12, left: 20),
        child: Column(
          children: <Widget>[
            Text(
              "智能锻炼计划",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "为您量身定做智能计划",
              style: TextStyle(fontSize: 17, color: Colors.white70),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/lake.jpeg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      height: 120,
    );
  }
}

class ViewMyPackageButton extends StatelessWidget {
  void _handleOnAction() {
    print("点击了查看我的套餐计划");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: MaterialButton(
          onPressed: _handleOnAction,
          color: Colors.green,
          child: Text(
            '查看我的套餐计划',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          height: 36,
          minWidth: 200,
        ),
      ),
    );
  }
}

class JM_SearchBar extends StatefulWidget {
  JM_SearchBar({Key key}) : super(key: key);

  @override
  _JMSearchBarState createState() => _JMSearchBarState();
}

class _JMSearchBarState extends State<JM_SearchBar> {
  bool _isActive = false;

  void _handleOnTap() {
    print('Handle tap action.');
  }

  void _handleOnChange(String rsText) {
    print("input text: $rsText");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 44,
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            Text(
              "搜索",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
//				TextField(
//					onTap: _handleOnTap,
//					onChanged: _handleOnChange,
//				)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        color: Colors.white,
      ),
    );
  }
}
