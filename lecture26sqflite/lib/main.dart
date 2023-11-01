import 'package:flutter/material.dart';
import 'package:lecture26sqflite/Create.dart';
import 'package:lecture26sqflite/Read.dart';
import 'package:lecture26sqflite/Services/Db_helper.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Create(),
                      ));
                },
                child: Text("Create")),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Read(),
                      ));

                  // var query = await Db_helper.instance.queryDatabase();
                  // print(query);
                },
                child: Text("Read")),
            ElevatedButton(
                onPressed: () {
                  Db_helper.instance.deleteRecord(1);
                },
                child: Text("Delete")),
            ElevatedButton(
                onPressed: () async {
                  await Db_helper.instance.updateRecord({
                    Db_helper.dt_id: 2,
                    Db_helper.dt_name: "SMAS",
                  });
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
