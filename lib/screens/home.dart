import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String OCM_ASSET_NAME = "assets/ocms/0/";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OCM Flex"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Mine",
              ),
              Tab(
                text: "All",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              itemCount: 1000,
              itemBuilder: (context, index) {
                return SvgPicture.asset("$OCM_ASSET_NAME${index + 1}.svg");
              },
            ),
            const Text("World"),
          ],
        ),
      ),
    );
  }
}
