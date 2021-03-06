import 'dart:math';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Constants.dart';
import 'Components/curvedLine.dart';

class Seats {
  bool selected;
  bool booked;
  Seats({
    this.selected = false,
    this.booked = false,
  });
}

class ConfirmMovieSeat extends StatefulWidget {
  const ConfirmMovieSeat({Key? key}) : super(key: key);

  @override
  _ConfirmMovieSeatState createState() => _ConfirmMovieSeatState();
}

final DateTime date = DateTime(2021, 9, 7, 10);

class _ConfirmMovieSeatState extends State<ConfirmMovieSeat> {
  List<DateTime> movieTime = [];
  List<Seats> seats = [];

  ok() {
    final myList = List<DateTime>.generate(6, (index) {
      return date;
    });

    var d = date;
    for (var i = 0; i < myList.length; i++) {
      myList[i] = d;
      d = d.add(new Duration(hours: 2, minutes: 30));
      print(d);
    }

    movieTime = myList;
    print(movieTime);
  }

  void initState() {
    super.initState();
    init();
    ok();
  }

  late int price = 0;

  calculatePrice() {
    var total = 0;
    for (var i = 0; i < seats.length; i++) {
      if (seats[i].selected)
        setState(() {
          total = total + 1;
        });
    }
    print(total);
    setState(() {
      price = total * 25;
    });
    print(price);
  }

  init() {
    var rng = new Random();
    seats = new List<Seats>.generate(45, (_) => Seats());
    var randomList = new List.generate(11, (_) => rng.nextInt(45));

    for (var i = 0; i < randomList.length; i++) {
      int j = randomList[i];
      seats[j].booked = true;
      print("object$i");
    }
  }

  int _current = 0;

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
                  FontAwesomeIcons.qrcode,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              box20,
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Captive State",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    height: 50,
                    viewportFraction: 0.25,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    onPageChanged: (e, x) {
                      setState(() {
                        _current = e;
                      });
                      print(movieTime[e]);
                    }),
                items: List.generate(movieTime.length, (i) {
                  return Text(DateFormat.jm().format(movieTime[i]),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: _current == i ? 20 : 16,
                          color: _current == i
                              ? Color(0xFFde3d36)
                              : Colors.white));
                }),
              ),
              Container(
                height: 50,
                child: CustomPaint(
                  painter: CurvePainter(),
                  child: Container(),
                ),
              ),
              Text("SCREEN",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  )),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: seats.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 9,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (!seats[index].booked)
                              setState(() {
                                seats[index].selected = !seats[index].selected;
                              });
                            else {}
                            calculatePrice();
                          },
                          child: new Container(
                            decoration: BoxDecoration(
                                color: seats[index].selected
                                    ? Color(0xFFde3d36)
                                    : seats[index].booked == true
                                        ? Colors.white
                                        : Colors.blueGrey[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              box20,
              box20,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.blueGrey[800],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Available",
                          style: GoogleFonts.montserrat(
                              color: Colors.white54,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Reserved",
                          style: GoogleFonts.montserrat(
                              color: Colors.white54,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Selected",
                          style: GoogleFonts.montserrat(
                              color: Colors.white54,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Buy Ticket",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            if (price != 0) Spacer(),
                            if (price != 0)
                              Text(
                                "\$ $price",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
