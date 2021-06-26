import 'package:flutter/material.dart';
import 'package:flutterui/Car%20Rental%20UI/Car%20Details.dart';
import 'package:flutterui/Car%20Rental%20UI/Constants.dart';
import 'package:flutterui/Widgets/Fade%20Route.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarRentalHomePage extends StatelessWidget {
  const CarRentalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List carsLogo = [
      "https://pngimg.com/uploads/bmw_logo/bmw_logo_PNG19707.png",
      "https://freepngimg.com/thumb/mercedes_benz/24322-9-mercedes-benz-logo-file.png",
      "https://www.freepnglogos.com/uploads/tesla-logo-red-png-0.png",
      "https://www.freepnglogos.com/uploads/toyota-logo-png/vehicle-toyota-auto-styling-6.png"
    ];

    List cars = [
      {
        "img":
            "https://freepngimg.com/download/honda/31954-5-honda-civic-transparent-image.png",
        "name": "Honda Civic\nSedan",
        "price": "\$ 25000"
      },
      {
        "img":
            "https://www.bmwusa.com/content/dam/bmwusa/5Series/my21/overview/desktop/BMW-MY21-5Series-Overview-MakeItYours.png.bmwimg.small.png",
        "name": "BMW 5 Series\nCoupe",
        "price": "\$ 93499"
      }
    ];

    List carsVertical = [
      {
        "img":
            "https://freepngimg.com/download/honda/31954-5-honda-civic-transparent-image.png",
        "name": "Honda Civic Sedan",
        "price": "\$ 25000"
      },
      {
        "img":
            "https://www.bmwusa.com/content/dam/bmwusa/5Series/my21/overview/desktop/BMW-MY21-5Series-Overview-MakeItYours.png.bmwimg.small.png",
        "name": "BMW 5 Series Coupe",
        "price": "\$ 93499"
      }
    ];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: CarRentalUI.secondaryColor,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: CarRentalUI.secondaryColor,
              ))
        ],
      ),
      drawer: Container(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome User!",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600)),
                    box5,
                    Text("Find Your Cars!",
                        style: GoogleFonts.montserrat(
                            fontSize: 25, fontWeight: FontWeight.w900)),
                    box20,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: new InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: CarRentalUI.primaryColor,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 15, right: 15),
                                  hintText: "Search Cars"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: CarRentalUI.secondaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            Icons.sort,
                            color: CarRentalUI.primaryColor,
                          ),
                        )
                      ],
                    ),
                    box15,
                    Container(
                      height: 85,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: carsLogo.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(right: 16),
                              width: MediaQuery.of(context).size.width / 5.1,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: CarRentalUI.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Image.network(carsLogo[index]),
                            );
                          }),
                    ),
                    box10,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Available Car's",
                    style: GoogleFonts.montserrat(
                        fontSize: 17, fontWeight: FontWeight.w800)),
              ),
              box15,
              Container(
                height: 200,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: cars.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            FadeRoute(page: CarDetails()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          width: MediaQuery.of(context).size.width / 2.35,
                          decoration: BoxDecoration(
                              color: CarRentalUI.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              box20,
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(4),
                                      width: double.maxFinite,
                                      child: Image.network(
                                        cars[index]["img"],
                                        fit: BoxFit.contain,
                                      ))),
                              box10,
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cars[index]["name"],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: CarRentalUI.secondaryColor,
                                            fontWeight: FontWeight.w700)),
                                    box10,
                                    Text(cars[index]["price"],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              box30,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Best Car's",
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.w800)),
                    Text("See all",
                        style: GoogleFonts.montserrat(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              box15,
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: carsVertical.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      width: double.maxFinite,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: CarRentalUI.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: CarRentalUI.bgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            height: 65,
                            width: 65,
                            child: Image.network(
                              carsVertical[index]["img"],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(carsVertical[index]["name"],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      color: CarRentalUI.secondaryColor,
                                      fontWeight: FontWeight.w700)),
                              box10,
                              Text("Sports, Coupe",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              box30,
                              Text(carsVertical[index]["price"],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: CarRentalUI.secondaryColor,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
