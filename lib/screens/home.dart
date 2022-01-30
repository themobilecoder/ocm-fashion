import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocm_viewer/screens/edit_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String ocmAssetName = "assets/ocms/";

  String _filter = "";
  final _controller = TextEditingController();

  final ocms = List<int>.generate(10000, (i) => i + 1).map((e) => e.toString());

  @override
  Widget build(BuildContext context) {
    final filteredOcms =
        ocms.where((element) => element.contains(_filter)).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OCM Fashion"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.deepPurple[800],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => {
                        setState(() {
                          _controller.clear();
                          _filter = "";
                        })
                      },
                    ),
                  ),
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _filter = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple[800],
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                  ),
                  itemCount: filteredOcms.length,
                  itemBuilder: (context, index) {
                    final ocmNumber = filteredOcms[index];
                    return Container(
                      color: Colors.deepPurple[800],
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "OCM #$ocmNumber",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                              ocmNumber: ocmNumber,
                                              title: "OCM #$ocmNumber",
                                            )),
                                  );
                                },
                                child: SvgPicture.asset(
                                  "$ocmAssetName$ocmNumber.svg",
                                  key: Key(ocmNumber.toString()),
                                  currentColor: Colors.transparent,
                                  placeholderBuilder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white10,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
