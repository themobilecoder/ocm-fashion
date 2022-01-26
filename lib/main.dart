import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OCM Flex',
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        lightIsWhite: false,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
        darkIsTrueBlack: false,
      ),
      home: const HomePage(),
    );
  }
}
