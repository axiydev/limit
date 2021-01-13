import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utils{
  static showToast({String text}){
    Fluttertoast.showToast(
        msg:text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static showAlert(BuildContext context)async{
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        title: Text('Delete'),
        content: Text('Are you sure?',),
        actions: [
          FlatButton(onPressed:(){
          }, child:Text('yes',style:TextStyle(color:Colors.white,fontSize:20))),
          FlatButton(onPressed: (){}, child:Text('no',style:TextStyle(color:Colors.white,fontSize:20)))
        ],
      ),
    );
  }
}