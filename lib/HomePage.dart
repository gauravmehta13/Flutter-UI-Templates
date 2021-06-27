import 'package:flutter/material.dart';
import 'package:flutterui/Car%20Rental%20UI/HomePage.dart';
import 'package:flutterui/Movie%20Booking/HomePage.dart';

import 'Car Rental UI/Car Details.dart';
import 'Widgets/Fade Route.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Screens> screens = [
    Screens(img: "", path: CarRentalHomePage(), name: "Car Rental UI"),
    Screens(img: "", path: MovieBookingHomePage(), name: "Movie Booking UI"),
    Screens(img: "", path: "", name: ""),
    Screens(img: "", path: "", name: ""),
    Screens(img: "", path: "", name: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: screens.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int i) {
          return new Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  FadeRoute(page: screens[i].path),
                );
              },
              child: new GridTile(
                footer: new Text(screens[i].name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                child: new Text(screens[i]
                    .img), //just for testing, will fill with image later
              ),
            ),
          );
        },
      ),
    );
  }
}

class Screens {
  final name;
  final img;
  final path;
  Screens({this.name, this.img, this.path});
}
