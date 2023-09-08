import 'package:flutter/material.dart';
import 'package:lecture13customwidget/utils/Customwid.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
  var students = ["Hassan", "hasan", "hussain", "hasnain", "Munsarim"];
  var studentsage = [21, 22, 50, 99, 404];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Customwid()
              .meralistview(students, students, studentsage, Colors.amber),
          Customwid().meralistviewcon(
              students, students, Axis.horizontal, Colors.indigo),
          Customwid()
              .meralistview(students, students, studentsage, Colors.teal),

          Customwid().meralistviewcon(
              students, students, Axis.vertical, Colors.indigo),

          // Row(children: [
          //   Customwid().textwid("منصرم"),
          //   Customwid().merabutton("Create"),
          // ]),
          // Customwid().textwid("Faizan"),
          // Customwid().merabutton("read"),
          // Customwid().textwid("Afnan"),
          // Customwid().merabutton("add"),
          // Customwid().textwid("Adnan"),
          // Customwid().merabutton("sub"),
          // Customwid().textwid("Hasan"),
          // Customwid().merabutton("submit"),
        ],
      ),
    );
  }
}
