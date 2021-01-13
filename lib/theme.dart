import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
ThemeData basicTheme(BuildContext context)=>ThemeData(
  primaryColor:Color.fromRGBO(2, 46, 251, 1),
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);