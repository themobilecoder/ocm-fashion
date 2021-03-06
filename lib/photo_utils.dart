import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/services.dart' show rootBundle;

Future<Photos> loadImage(double frameSize, String ocmNumber) async {
  final directory = await rootBundle.loadString("assets/ocms/$ocmNumber.svg");
  final svgRoot = await svg.fromSvgString(directory, directory);

  final data = await rootBundle.load('assets/sunglasses.png');
  final fileBytes = data.buffer.asUint8List();

  final codec = await ui.instantiateImageCodec(fileBytes);
  final resizedImage = (await codec.getNextFrame()).image;

  return Photos(resizedImage, svgRoot, data.buffer.asUint8List());
}

Future<DrawableRoot> loadSvg(String filepath) async {
  final directory = await rootBundle.loadString(filepath);
  return svg.fromSvgString(directory, directory);
}

Future<ui.Image> loadAccessories(String filepath) async {
  final data = await rootBundle.load(filepath);
  final fileBytes = data.buffer.asUint8List();
  final codec = await ui.instantiateImageCodec(fileBytes);
  final image = (await codec.getNextFrame()).image;
  return image;
}

class Photos {
  Photos(this.image, this.ocm, this.imageList);
  final ui.Image image;
  final DrawableRoot ocm;
  final List<int> imageList;
}
