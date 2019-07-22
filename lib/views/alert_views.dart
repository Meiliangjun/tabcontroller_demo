import 'package:flutter/material.dart';

import 'package:tabcontroller_demo/models/User.dart';


class FeedbackRow extends StatefulWidget {

  FeedbackRow({Key key, this.feedback}) : super(key: key);

  FeedbackInfo feedback;

  @override
  _FeedbackRowState createState() => _FeedbackRowState();
}

class _FeedbackRowState extends State<FeedbackRow> {

  void _handleFavorTap() {
    setState(() {
      widget.feedback.hasFavor = !widget.feedback.hasFavor;
    });
  }

  void _handleShareTap() {
    print("share the feedback.");
  }
  
  void _handleCommentTap() {
    print("click comment button.");
  }

  void _handleConcern() {
    setState(() {
      widget.feedback.user.hasConcern = !widget.feedback.user.hasConcern;
    });
  }

  @override
  Widget build(BuildContext context) {

    FeedbackInfo info = widget.feedback;
    Account user = info.user;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Cell中的个人信息栏
              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(user.headIcon,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(user.name, style: TextStyle(fontSize: 16, color: Colors.black),),
                      Text("反馈分类", style: TextStyle(fontSize: 12, color: Colors.grey),),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Spacer(),
                  MaterialButton(onPressed: _handleConcern,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 24,
                    child:
                    user.hasConcern ? Text("已关注", style: TextStyle(fontSize: 16, color: Colors.black26),) :
                    Text("关注", style: TextStyle(fontSize: 16, color: Colors.black87),),
                  ),
                ],
              ),
              // 反馈中的标题栏
              Padding(padding: EdgeInsets.only(top: 12, bottom: 4),
                child: Text(
                  info.headerTitle,
                  textAlign: TextAlign.start,
//                textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              // 分割线
              Divider(height: 0.5, color: Colors.black26,),
              // 内容栏
              Padding(padding: EdgeInsets.only(top: 8, bottom: 12),
                child: Text(info.body,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              // 图片展示栏
              Row(
                children: <Widget>[
                  Image.asset("images/lake.jpeg", fit: BoxFit.cover, height: 68,),
                  Padding(padding: EdgeInsets.only(left: 4,),
                    child: Image.asset("images/lake.jpeg", fit: BoxFit.cover, height: 68,),
                  ),
                ],
              ),
            ],
          ),
          // 按钮栏
          Positioned(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: _handleCommentTap,
                  child: Icon(Icons.speaker_notes, color: Colors.black54,),
                ),
                GestureDetector(
                  onTap: _handleShareTap,
                  child: Icon(Icons.share, color: Colors.green,),
                ),
                GestureDetector(
                  onTap: _handleFavorTap,
                  child: Icon(info.hasFavor ? Icons.favorite : Icons.favorite_border, color: info.hasFavor ? Colors.red : Colors.grey,),// info.hasFavor ? Icons.favorite :
                ),
              ],
            ),
            bottom: 0,
            right: 1,
          )
        ],
      ),
    );
  }
}


class AdviceFeedback extends StatelessWidget {

  AdviceFeedback({Key key, this.adviceFBs}) : super(key: key);

  final List<FeedbackInfo> adviceFBs;
//  var isLast = false;

  @override
  Widget build(BuildContext context) {

    var columns = [];
    final total = adviceFBs.length;
    for (var index = 0; index < total / 2; ++ index) {
      columns.add(index);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("推荐反馈"),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: columns.map((index) {
              final startIndex = index * 2;
              final endIndex = startIndex + 1;
              final isSingle = endIndex == total;
//              setState(() {
//                widget.isLast = startIndex == totalCount;
//              });
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("$startIndex"),
                  ),
                  isSingle ? Text("single text") : Text("$endIndex"),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

}

class _AdviceFeedbackState extends State<AdviceFeedback> {


}