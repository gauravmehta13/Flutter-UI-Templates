import 'package:flutter/material.dart';
import 'package:flutterui/Car%20Rental%20UI/Constants.dart';
import 'package:flutterui/Car%20Rental%20UI/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: themeData(context),
      home: CarRentalHomePage(),
    );
  }
}
