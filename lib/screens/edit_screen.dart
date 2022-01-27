import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditScreen extends StatelessWidget {
  EditScreen(
      {Key? key, required final this.ocmNumber, required final this.title})
      : super(key: key);

  final double frameSize = 500;
  final String ocmNumber;
  final String title;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.amber[900],
            child: Center(
              child: SizedBox(
                height: frameSize,
                width: frameSize,
                child: Center(
                  child: SvgPicture.asset('assets/ocms/$ocmNumber.svg'),
                ),
              ),
            ),
          ),
          Center(
            child: PageView.builder(
              itemCount: accessoriesString.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: frameSize,
                  width: frameSize,
                  child: Center(
                    child: Image.asset(accessoriesString[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
