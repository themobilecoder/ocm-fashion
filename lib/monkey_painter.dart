import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonkeyPainter extends CustomPainter {
  MonkeyPainter(this.ocm);

  final DrawableRoot ocm;

  @override
  void paint(Canvas canvas, Size size) {
    ocm.scaleCanvasToViewBox(canvas, Size(size.width, size.width));
    ocm.clipCanvasToViewBox(canvas);
    ocm.draw(canvas, Rect.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
