import 'package:flutter/material.dart';

import 'models/User.dart';
import 'views/alert_views.dart';

class FeedbackController extends StatelessWidget {

  const FeedbackController({Key key}) : super(key: key);
//  final Account user = Account(name: 'zhang')
//  final _users = const [const Account(name: "Hello"),  Account(name: "World")];
//  List<Account> _users = [Account('Jack', 'Hello, my name is Jack', '')];

  @override
  Widget build(BuildContext context) {
    final _user = Account('Jack', signature: "You may wish apple or orange, but you will get peach.", headIcon: "images/girls/girl_01.jpg", hasConcern: false);
    final _feedbacks = [
      FeedbackInfo(_user,
        headerTitle: "I think that is pretty picture.",
        body: "Show my pictures",
        fbImagePaths: ['images/lake.jpeg'],
        hasFavor: true,
      ),
      FeedbackInfo(Account('Helen', signature: "What's the difference between 'try' and 'triumph'? The spirit is willing, but the flesh is weak.", headIcon: "images/girls/girl_04.jpeg", hasConcern: true),
        headerTitle: "I think that is pretty picture.",
        body: "Show my pictures Helen say",
        fbImagePaths: ['images/lake.jpeg'],
        hasFavor: false,
      ),
    ];

    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          FeedbackHeader(_user,),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {

                if (index >= _feedbacks.length) {
                  return AdviceFeedback(adviceFBs: _feedbacks,);
                }

                final fb = _feedbacks[index];

                return FeedbackRow(feedback: fb,);
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Divider(
                    color: Colors.black12,
                    height: 0.5,
                  ),
                );
              },
              itemCount: _feedbacks.length + 1,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(onPressed: null,
        backgroundColor: Colors.transparent,
        child: Image.asset("images/icons/add.png"),
      ),
    );
  }
}

class FeedbackHeader extends StatelessWidget {

  final Account user;

  FeedbackHeader(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset('images/girls/girl_01.jpg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Column(children: <Widget>[
                Text(user.name,
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                Text(user.signature,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            width: 240,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.black87,
      height: 200.0,
      padding: EdgeInsets.only(top: 30),
    );
  }

}