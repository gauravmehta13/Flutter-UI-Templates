import 'package:flutter/material.dart';
import 'package:flutterui/HomePage.dart';
import 'Constants.dart';
import 'Movie Booking/HomePage.dart';

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
      home: MovieBookingHomePage(),
    );
  }
}
