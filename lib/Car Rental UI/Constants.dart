import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

themeData(context) {
  return ThemeData(
    appBarTheme:
        Theme.of(context).appBarTheme.copyWith(brightness: Brightness.light),
    textTheme: GoogleFonts.montserratTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}

launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+918209145057',
    text: "Hey! I'm inquiring about the services provided by Goflexe",
  );
  await launch('$link');
}

const EdgeInsets padding10 = EdgeInsets.all(10);
const SizedBox box5 = SizedBox(
  height: 5,
);
const SizedBox box10 = SizedBox(
  height: 10,
);
const SizedBox box15 = SizedBox(
  height: 15,
);
const SizedBox box20 = SizedBox(
  height: 20,
);
const SizedBox box30 = SizedBox(
  height: 30,
);

class CarRentalUI {
  static const Color primaryColor = Color(0xFFffffff);
  static const Color secondaryColor = Color(0xFF021637);
  static const Color bgColor = Color(0xFFf9fafe);
}
