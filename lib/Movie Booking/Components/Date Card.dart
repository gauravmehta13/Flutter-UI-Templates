import 'package:flutter/material.dart';
import 'package:flutterui/Constants.dart';

class DateCard extends StatelessWidget {
  final date;

  const DateCard({
    this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: RotatedBox(
        quarterTurns: 1,
        child: ClipPath(
          clipper: DolDurmaClipper(right: 20, holeRadius: 10),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.1, 0.5, 0.9],
                  colors: [
                    Color.fromARGB(255, 254, 69, 65),
                    Color.fromARGB(255, 213, 59, 54),
                    Color.fromARGB(255, 171, 50, 47)
                  ],
                ),
              ),
              width: 100,
              height: 70,
              padding: EdgeInsets.all(5),
              child: RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Color.fromARGB(255, 14, 14, 24),
                    ),
                    Text("Fri", style: TextStyle(color: Colors.white)),
                    Text("10",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
