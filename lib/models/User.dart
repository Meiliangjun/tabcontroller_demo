import 'package:meta/meta.dart';

class Account {
  String name, signature, headIcon;
  bool hasConcern = false;
  //@requeired 表示必须要输入的字段，否则编译器会报错
  Account(@required this.name, {String signature, String headIcon, this.hasConcern}) {
    this.name = name;
    this.signature = signature;
    this.headIcon = headIcon;
  }
}

class FeedbackInfo {
  Account user;
  String headerTitle, body;
  bool hasFavor = false;
  List<String> fbImagePaths;

  FeedbackInfo(@required this.user, {this.headerTitle, this.body, this.fbImagePaths, this.hasFavor});
}