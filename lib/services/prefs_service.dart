import 'dart:convert';

import 'package:limit/models/time_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static Future<bool> saveTime(Tme tme)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String tm=jsonEncode(tme);
    prefs.setString('tm',tm);
  }
  static Future<Tme> loadTme()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String tm=prefs.get('tm');
    if(tm==null || tm.isEmpty){
      return null;
    }
    Map map=jsonDecode(tm);
    return Tme.fromJson(map);
  }

  static Future<bool> removeTme()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    return prefs.remove('tm');
  }
}