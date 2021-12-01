import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCM Viewer',
      theme: FlexThemeData.light(
        scheme: FlexScheme.ebonyClay,
        lightIsWhite: false,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.ebonyClay,
        darkIsTrueBlack: false,
      ),
      home: const HomePage(),
    );
  }
}
