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
      home: const BMI(),
    );
  }
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var weightController = TextEditingController();
  var heightfeetController = TextEditingController();
  var heightinchController = TextEditingController();

  var result = " ";
  var msg = " ";
  var bgcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: heightfeetController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height Feet",
                  hintText: "Enter Your Height In feet",
                  prefixIcon: Icon(Icons.height)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: heightinchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height inches",
                  hintText: "Enter Your Height In inches",
                  prefixIcon: Icon(Icons.height)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Weight",
                  hintText: "Enter Your Weight",
                  prefixIcon: Icon(Icons.monitor_weight)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  var weightvalue = weightController.text;
                  var feetvalue = heightfeetController.text;
                  var inchesvalue = heightinchController.text;

                  if (weightvalue == "" &&
                      feetvalue == "" &&
                      inchesvalue == "") {
                    result = "Insert your all fields";
                  } else {
                    var wv = int.parse(weightvalue);
                    var fv = int.parse(feetvalue);
                    var iv = int.parse(inchesvalue);

                    var totalinches = fv * 12 + iv;

                    var totalcentimeter = totalinches * 2.54;

                    var meters = totalcentimeter / 100;

                    // bmi= kg/ m^2
                    double bmi = wv / (meters * meters);

                    if (bmi <= 18) {
                      msg = "underweight";
                      bgcolor = Colors.red;
                    }
                    // 18.5 to 24.9.

                    else if (bmi > 18.5 && bmi <= 24.5) {
                      msg = "Healthy MashAllah";
                      bgcolor = Colors.green;
                    } else {
                      msg = "Over Weight OOPS!";
                      bgcolor = Colors.yellow;
                    }

                    result = "$msg\n Your Bmi Is = ${bmi.toStringAsFixed(3)}";
                  }
                });
              },
              child: Text("Calculate BMI")),
          Text(
            "$result",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
      backgroundColor: bgcolor,
    );
  }
}
