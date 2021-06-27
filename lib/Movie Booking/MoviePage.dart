import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/Constants.dart';
import 'package:flutterui/Movie%20Booking/Components/Date%20Card.dart';
import 'package:flutterui/Movie%20Booking/Confirm%20Seat.dart';
import 'package:flutterui/Widgets/Fade%20Route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetails extends StatefulWidget {
  final image;
  const MovieDetails({Key? key, this.image}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<DateTime> dates = [];
  void initState() {
    super.initState();

    final myList = List<DateTime>.generate(7, (index) {
      return DateTime.now().add(new Duration(days: index));
    });

    dates = myList;
    print(dates);
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 44, 56),
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //     leading: Icon(Icons.arrow_back_ios),
      //     actions: [
      //       IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             FontAwesomeIcons.tags,
      //             size: 18,
      //           )),
      //     ]),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
              )),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fitWidth,
                )),
            Center(
                child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: new Container(),
            )),
            Container(
              color: Colors.black.withOpacity(0.4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.tags,
                                size: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                  Spacer(),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
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
                          "An Ironman Triathlon is one of a series of long-distance triathlon races organized by the World Triathlon Corporation, consisting of a 2.4-mile swim, a 112-mile bicycle ride and a marathon 26.22-mile run, raced in that order. It is widely considered one of the most difficult one-day sporting events in the world.",
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        box30,
                        box20,
                        Text(
                          "Select Date",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        box30,
                      ],
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        height: 120,
                        viewportFraction: 0.2,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (e, x) {
                          setState(() {
                            _current = e;
                          });
                          print(dates[e]);
                        }),
                    items: List.generate(dates.length, (index) {
                      return DateCard(
                        date: dates[index],
                        current: _current,
                        index: index,
                      );
                    }),
                  ),
                  box30,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadeRoute(page: ConfirmMovieSeat()),
                      );
                    },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                          height: 60,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Reservation",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
