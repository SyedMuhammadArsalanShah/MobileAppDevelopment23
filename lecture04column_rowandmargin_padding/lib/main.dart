import 'package:flutter/material.dart';
import 'package:lecture04column_rowandmargin_padding/First.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: First(),
      ),
    );
  }
}
