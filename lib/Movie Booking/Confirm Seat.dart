import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterui/Widgets/Fade%20Route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';

class ConfirmMovieSeat extends StatefulWidget {
  const ConfirmMovieSeat({Key? key}) : super(key: key);

  @override
  _ConfirmMovieSeatState createState() => _ConfirmMovieSeatState();
}

class _ConfirmMovieSeatState extends State<ConfirmMovieSeat> {
  List<bool> seats = [];
  void initState() {
    super.initState();
    init();
  }

  init() {
    var rng = new Random();
    seats = new List<bool>.generate(45, (_) => false);
    var randomList = new List.generate(11, (_) => rng.nextInt(45));

    for (var i = 0; i < randomList.length; i++) {
      int j = randomList[i];
      seats[j] = true;
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              box20,
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pacific Rim",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: seats.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 9,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return new Container(
                          decoration: BoxDecoration(
                              color: seats[index]
                                  ? Colors.grey[700]
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.grey,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    FadeRoute(page: ConfirmMovieSeat()),
                  );
                },
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Buy Ticket",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "\$ 25",
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
