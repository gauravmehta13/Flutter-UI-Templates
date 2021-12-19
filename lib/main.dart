import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Movie Booking/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sketches',
      theme: themeData(context),
      home: MovieBookingHomePage(),
    );
  }
}
