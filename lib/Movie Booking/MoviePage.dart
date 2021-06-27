import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutterui/Constants.dart';
import 'package:flutterui/Movie%20Booking/Components/Date%20Card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatefulWidget {
  final image;
  const MovieDetails({Key? key, this.image}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 42, 44, 56),
          leading: Icon(Icons.arrow_back_ios),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.tags,
                  size: 18,
                )),
          ]),
      extendBodyBehindAppBar: true,
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
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kaggitan\nHayatlar Dark",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    box20,
                    Row(
                      children: [
                        Text(
                          "⭐ 8.3",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFdfa51d),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xFFdfa51d),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Text(
                            "IMDB 7.5",
                            style: GoogleFonts.montserrat(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    box20,
                    Text(
                      "Director :  Can Ulkay     |     Writer :  Ercan Mehmat",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    box10,
                    Text(
                      "Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director Director ",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    box30,
                    Text(
                      "Select Date",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    box20,
                    box30,
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: [DateCard()],
              ),
              box30,
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Color.fromARGB(255, 254, 69, 65),
                        Color.fromARGB(255, 213, 59, 54),
                        Color.fromARGB(255, 171, 50, 47)
                      ],
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Reservation",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
