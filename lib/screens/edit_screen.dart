import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ocm_viewer/download_utils_native.dart'
    if (dart.library.html) 'package:ocm_viewer/download_utils_web.dart'
    as download_utils;

class EditScreen extends StatefulWidget {
  const EditScreen({
    Key? key,
    required final this.ocmNumber,
    required final this.title,
  }) : super(key: key);

  final double frameSize = 500;
  final String ocmNumber;
  final String title;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accessoriesString = [
      'assets/aviator.png',
      'assets/moustache.png',
      'assets/party_mask.png',
      'assets/sunglasses.png',
      'assets/masquerade.png',
      'assets/heart_glasses.png',
      'assets/wig1.png'
    ];
    final actions = (kIsWeb)
        ? [
            IconButton(
              onPressed: _saveMonkeyAsImage,
              icon: const Icon(Icons.save),
            )
          ]
        : null;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: actions,
      ),
      body: Container(
        color: Colors.amber[900],
        child: Center(
          child: Screenshot(
            controller: screenshotController,
            child: SizedBox(
              height: widget.frameSize,
              width: widget.frameSize,
              child: Stack(
                children: [
                  Center(
                    child: Center(
                      child: SvgPicture.asset(
                          'assets/ocms/${widget.ocmNumber}.svg'),
                    ),
                  ),
                  Center(
                    child: PageView.builder(
                      itemCount: accessoriesString.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Image.asset(accessoriesString[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveMonkeyAsImage() {
    screenshotController.capture(pixelRatio: 4).then((value) {
      download_utils.save(value!, 'ocm_${widget.ocmNumber}');
    });
  }
}
