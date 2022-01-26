import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocm_viewer/screens/edit_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String ocmAssetName = "assets/ocms/";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OCM Sunnies"),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          ),
          itemCount: 10000,
          itemBuilder: (context, index) {
            final ocmNumber = index + 1;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditScreen(ocmNumber: ocmNumber)),
                );
              },
              child: SvgPicture.asset(
                "$ocmAssetName$ocmNumber.svg",
                currentColor: Colors.transparent,
              ),
            );
          },
        ),
      ),
    );
  }
}
