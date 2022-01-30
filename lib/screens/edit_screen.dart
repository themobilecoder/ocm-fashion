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
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final accessoriesString = [
      '',
      'assets/sunglasses.png',
      'assets/aviator.png',
      'assets/eyeglasses-isolated.png',
      'assets/funky-sunnies.png',
      'assets/heart-sunnies.png',
      'assets/masquerade-1.png',
      'assets/masquerade-2.png',
      'assets/moustache.png',
      'assets/pixel-sunnies.png',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.deepPurple[800],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
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
                          controller: _pageController,
                          itemCount: accessoriesString.length,
                          onPageChanged: (page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            if (accessoriesString[index].isEmpty) {
                              return Container();
                            } else {
                              return Center(
                                child: Image.asset(accessoriesString[index]),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${currentPage + 1} / ${accessoriesString.length}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: widget.frameSize,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          if (currentPage > 0) {
                            _pageController.animateToPage(currentPage - 1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          _openMonkeyAsImage();
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        iconSize: 50,
                        onPressed: () {
                          if (currentPage < accessoriesString.length) {
                            final newPage = currentPage + 1;
                            _pageController.animateToPage(newPage,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          }
                        },
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _openMonkeyAsImage() {
    screenshotController.capture(pixelRatio: 4).then((value) {
      download_utils.openImage(value!, 'ocm_${widget.ocmNumber}');
    });
  }
}
