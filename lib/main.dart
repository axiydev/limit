import 'package:flutter/material.dart';
import 'package:limit/pages/home_page.dart';
import 'dart:math';
import 'package:limit/theme.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(context),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes:{
        HomeScreen.id:(context)=>HomeScreen(),
      },
    );
  }
}


