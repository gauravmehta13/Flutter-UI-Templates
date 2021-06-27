import 'package:flutter/material.dart';
import 'package:flutterui/Widgets/imageview360.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  List<ImageProvider> imageList = [];
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  List details = [
    {"property": "Price", "value": "₹ 17.95 Lakh"},
    {"property": "Mileage", "value": "25.35 kmpl"},
    {"property": "Engine", "value": "1799 cc"},
    {"property": "Transmission", "value": "Automatic (CVT)"},
    {"property": "Fuel Type", "value": "Petrol & Diesel"},
    {"property": "Seating Capacity", "value": "5 Seater"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text("Car Details",
            style: GoogleFonts.montserrat(
                color: CarRental.secondaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: CarRental.secondaryColor,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.tags,
                size: 18,
                color: CarRental.secondaryColor,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 72.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (imagePrecached == true)
                    ? Expanded(
                        child: ImageView360(
                          key: UniqueKey(),
                          imageList: imageList,
                          autoRotate: autoRotate,
                          rotationCount: 1,
                          rotationDirection: RotationDirection.anticlockwise,
                          frameChangeDuration: Duration(milliseconds: 60),
                          swipeSensitivity: swipeSensitivity,
                          allowSwipeToRotate: allowSwipeToRotate,
                          onImageIndexChanged: (currentImageIndex) {
                            print("currentImageIndex: $currentImageIndex");
                          },
                        ),
                      )
                    : Expanded(child: Text("Pre-Caching images...")),
                Expanded(
                    flex: 2,
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: CarRental.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          box15,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Honda Civic",
                                      style: GoogleFonts.montserrat(
                                          color: CarRental.secondaryColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800)),
                                  box5,
                                  Text("Sports, Coupe",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.grey[400],
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text("\$ 250/day",
                                  style: GoogleFonts.montserrat(
                                      color: CarRental.secondaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800)),
                            ],
                          ),
                          Spacer(),
                          Text("Description",
                              style: GoogleFonts.montserrat(
                                  color: CarRental.secondaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800)),
                          box10,
                          Text(
                            "Originally a subcompact, the Civic has gone through several generational changes, becoming both larger and more upscale, moving into the compact car segment. EPA guidelines for vehicle size class stipulate a car having combined passenger and cargo room of 110 to 119.9 cubic feet (3,110 to 3,400 L) is considered a mid-size car, and as such the tenth generation Civic sedan is technically a small-end mid-size car, although it still competes in the compact class.[2] The Civic coupé is still considered a compact car.",
                            style: TextStyle(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Container(
                            height: 70,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: details.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 15),
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      decoration: BoxDecoration(
                                          color: index != 0
                                              ? CarRental.primaryColor
                                              : CarRental.primaryColor,
                                          border: Border.all(
                                            color: CarRental.secondaryColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(details[index]["value"],
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  color:
                                                      CarRental.secondaryColor,
                                                  fontWeight: FontWeight.w700)),
                                          Text(details[index]["property"],
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Spacer(),
                          Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: SizedBox(
                                height: 55,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        CarRental.secondaryColor, // background
                                    onPrimary: Colors.white, // foreground
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Book Now",
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 52; i++) {
      imageList.add(AssetImage('assets/CarRental/verna/$i.png'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/CarRental/verna/$i.png'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}
