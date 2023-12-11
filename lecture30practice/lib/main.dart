import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
                color: Colors.teal,
                width: 100,
                height: 100,
                child: Center(
                    child: Text(
                  "Zaid And Ahsan ",
                  style: TextStyle(color: Colors.white),
                )))),
      ),
    );
  }
}
