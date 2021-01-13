import 'package:flutter/cupertino.dart';

class Tme{
  String time;
  String act;
  Tme({@required this.time,@required this.act});
  Tme.fromJson(Map<String,dynamic> json):
      this.time=json['time'],
      this.act=json['act'];
  Map<String,dynamic> toJson(){
    return {
      'time':this.time,
      'act':this.act,
    };
  }
}