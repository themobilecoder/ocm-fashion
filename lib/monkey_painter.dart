import 'package:flutter/material.dart';
import 'package:ocm_viewer/photo_utils.dart';

class MonkeyPainter extends CustomPainter {
  MonkeyPainter(this.image);

  final Photos image;

  @override
  void paint(Canvas canvas, Size size) {
    // _drawBackground(canvas);
    _drawOcm(canvas, size);
    _drawSunglasses(size, canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _drawBackground(Canvas canvas) {
    canvas.drawColor(Colors.blue, BlendMode.src);
  }

  void _drawSunglasses(Size size, Canvas canvas) {
    canvas.drawImage(image.image, Offset.zero, Paint());
  }

  void _drawOcm(Canvas canvas, Size size) {
    image.ocm.scaleCanvasToViewBox(canvas, Size(size.width, size.width));
    image.ocm.clipCanvasToViewBox(canvas);
    image.ocm.draw(canvas, Rect.zero);
  }
}
