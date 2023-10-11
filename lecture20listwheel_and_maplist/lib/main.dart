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
  var arraylist = [
    {
      "name": "ammarah",
      "age": "50",
      "msg": "hello sir kya haal hain app boht biased hain "
    },
    {"name": "Hamna", "age": "30", "msg": "hello sir "},
    {"name": "Fatimah", "age": "40", "msg": "hello sir "},
    {"name": "Zimal", "age": "60", "msg": "hello sir "},
    {"name": "Zoma", "age": "70", "msg": "hello sir "},
    {"name": "Hoorain", "age": "70", "msg": "hello sir "},
    {"name": "Hafsa", "age": "70", "msg": "hello sir "},
    {"name": "Sabifa", "age": "600", "msg": "hello sir "},
    {"name": "Affan", "age": "300", "msg": "hello sir "},
    {"name": "Hassan", "age": "1200", "msg": "hello sir "},
    {"name": "Hamza", "age": "45", "msg": "hello sir "},
    {"name": "Hussain", "age": "0.1", "msg": "hello sir "},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListWheelScrollView(
          itemExtent: 400,
          children: arraylist.map((index) {
            return Card(
              child: ListTile(
                tileColor: Colors.black38,
                title: Text(index["name"].toString()),
                trailing: Text(index["age"].toString()),
                subtitle: Text(index["msg"].toString()),
              
              ),
            );
          }).toList(),
        ),
      ),

      // body: ListWheelScrollView(
      //   itemExtent: 100,
      // children: [
      // Container(color:Colors.amber,),
      // Container(color:Colors.amber,),
      // Container(color:Colors.amber,),
      // Container(color:Colors.amber,),
      // Container(color:Colors.amber,),

      // ]),
    );
  }
}
