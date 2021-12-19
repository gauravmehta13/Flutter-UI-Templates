import 'dart:ui';

import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.blueGrey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    var startPoint = Offset(0, size.height);
    var controlPoint1 = Offset(size.width / 4, size.height / 10);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 10);
    var endPoint = Offset(size.width, size.height);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
