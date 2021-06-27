import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutterui/Constants.dart';
import 'package:flutterui/Movie%20Booking/MoviePage.dart';
import 'package:flutterui/Widgets/Fade%20Route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieBookingHomePage extends StatefulWidget {
  const MovieBookingHomePage({Key? key}) : super(key: key);

  @override
  _MovieBookingHomePageState createState() => _MovieBookingHomePageState();
}

class _MovieBookingHomePageState extends State<MovieBookingHomePage> {
  List images = [
    "https://images.fandango.com/ImageRenderer/0/0/redesign/static/img/default_poster.png/0/images/masterrepository/other/ant_man_ver5.jpg",
    "https://cdn.shopify.com/s/files/1/0057/3728/3618/products/space-jam-a-new-legacy_hhwsqipd_240x360_crop_center.progressive.jpg?v=1618580955",
    "https://i.pinimg.com/originals/27/04/ee/2704ee6494308b58ba3968f17354596f.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.9],
              colors: [
                Color.fromARGB(255, 42, 44, 56),
                Color(0xFF252432),
                Color.fromARGB(255, 14, 14, 24)
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              box20,
              Container(
                padding: EdgeInsets.all(25),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello User!",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        box5,
                        Text(
                          "Book Your Favourite Movie",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white70,
                        backgroundImage: NetworkImage(
                            "https://lh3.googleusercontent.com/ogw/ADea4I7QPiHn9c10vvVa_h9BTVwCFcbTGKTUDPlwuIWhs9o=s192-c-mo"))
                  ],
                ),
              ),
              box10,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey[300],
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.grey[300],
                      ),
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(0.2),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(18),
                      hintText: "     Search",
                      hintStyle: TextStyle(color: Colors.grey[400])),
                ),
              ),
              box20,
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Feature Movies",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Swiper(
                  itemCount: images.length,
                  itemHeight: 380,
                  itemWidth: 250,
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: CustomLayoutOption(
                    startIndex: -1,
                    stateCount: 3,
                  ).addRotate([-30 / 180, 0, 30 / 180]).addTranslate([
                    new Offset(-300, -10),
                    new Offset(0, 0),
                    new Offset(300, 0),
                  ]),
                  control: new SwiperControl(),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          FadeRoute(
                              page: MovieDetails(
                            image: images[i],
                          )),
                        );
                      },
                      child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Image.network(
                            images[i],
                            fit: BoxFit.fill,
                          )),
                    );
                  },
                ),
              ),
              box20,
              Container(
                padding: EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        box5,
                        CircleAvatar(radius: 2, backgroundColor: Colors.white)
                      ],
                    ),
                    Icon(
                      FontAwesomeIcons.compass,
                      color: Colors.white24,
                    ),
                    Icon(
                      FontAwesomeIcons.ticketAlt,
                      color: Colors.white24,
                    ),
                    Icon(
                      FontAwesomeIcons.user,
                      size: 20,
                      color: Colors.white24,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
