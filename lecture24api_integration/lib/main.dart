import 'package:flutter/material.dart';
import 'package:lecture24api_integration/FirstMethodApi.dart';
import 'package:lecture24api_integration/SecondMethodApi.dart';
import 'package:lecture24api_integration/ThirdMethodApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const FirstMethodApi(),
      // home: const SecondMethodApi(),
      home: const ThirdMethodApi(),
    );
  }
}
