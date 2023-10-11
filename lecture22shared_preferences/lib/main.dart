import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController myvalue = TextEditingController();

  String getresult = "";

  void reload() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var res = preferences.getString("uservalue");//

    // getresult = res != null ? res : "here is my name";
    getresult = res ?? "here is my name";

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: myvalue,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String name = myvalue.text.toString();

                  final SharedPreferences myvaluepref =
                      await SharedPreferences.getInstance();

                  myvaluepref.setString("uservalue", name);
                },
                child: Text("My  Value ")),
            Text("$getresult")
          ],
        ),
      ),
    );
  }
}
