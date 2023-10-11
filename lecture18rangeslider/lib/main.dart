import 'package:flutter/material.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // read values 
  RangeValues values = const RangeValues(0,10000);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels=RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      body: RangeSlider(
        values: values,
        labels: labels,
        min: 0,
        max: 100000,
        divisions: 10,

        inactiveColor: Colors.amber,
        activeColor: Colors.teal,

        onChanged: (value) {
          values= value;
          setState(() {});
        },
      ),
    );
  }
}
