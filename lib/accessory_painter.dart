import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AcessoryPainter extends CustomPainter {
  AcessoryPainter(this.image);

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.src);
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
