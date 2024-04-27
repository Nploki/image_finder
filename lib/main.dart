import 'package:flutter/material.dart';
import 'package:image_search_assignment/pages/search_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
