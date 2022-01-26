import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:ocm_viewer/monkey_painter.dart';

import '../photo_utils.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required final this.ocmNumber}) : super(key: key);

  final double frameSize = 300;
  final String ocmNumber;

  @override
  Widget build(BuildContext context) {
    final ocmMonkey = loadImage(frameSize, ocmNumber);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amber[900],
        child: Center(
          child: FutureBuilder<Photos>(
              future: ocmMonkey,
              builder: (BuildContext context, AsyncSnapshot<Photos> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: frameSize,
                    width: frameSize,
                    child: Center(
                      child: CustomPaint(
                        painter: MonkeyPainter(snapshot.data!),
                        size: ui.Size.square(frameSize),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.blue,
                  );
                }
              }),
        ),
      ),
    );
  }
}
