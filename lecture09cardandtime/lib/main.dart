import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cards and its types")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Card(
                child: Text(
                    "current time  By Date Class : ${time.hour}: ${time.minute}"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "DateFormat by Package    ${DateFormat('yMd').format(time)}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.green,
            ),
            Card(
              child: ListTile(
                title: Text("Codesinsider.com"),
              ),
              elevation: 12,
              shadowColor: Colors.green,
            ),
            Card(
              child: ListTile(
                title: Text("Codesinsider.com"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            Card(
              child: ListTile(
                //leading: Icon(Icons.music_note),
                title: Text("Codesinsider.com"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
            ),
            Card(
              child: ListTile(
                title: Text("Codesinsider.com"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.teal, width: 3)),
            ),
            Container(
              height: 200,
              width: 200,
              child: Card(
                child: ListTile(
                  title: Text("Codesinsider.com"),
                ),
                elevation: 8,
                shadowColor: Colors.green,
                margin: EdgeInsets.all(20),
              ),
            ),
            Card(
              child: Container(
                height: 160,
                width: 160,
                child: Center(
                  child: ListTile(
                    title: Text("Codesinsider.com"),
                  ),
                ),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
