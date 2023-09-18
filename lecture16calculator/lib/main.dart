import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
      home: const HomeTwo(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var num1 = TextEditingController();
  var num2 = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: num1,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: num2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        var numvalue1 = num1.text.toString();
                        var numvalue2 = num2.text.toString();

                        double ans =
                            double.parse(numvalue1) + double.parse(numvalue2);

                        result = ans.toString();

                        setState(() {});
                      },
                      child: Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        var numvalue1 = num1.text.toString();
                        var numvalue2 = num2.text.toString();

                        double ans =
                            double.parse(numvalue1) * double.parse(numvalue2);

                        result = ans.toString();

                        setState(() {});
                      },
                      child: Text("Mul")),
                  ElevatedButton(
                      onPressed: () {
                        var numvalue1 = num1.text.toString();
                        var numvalue2 = num2.text.toString();

                        double ans =
                            double.parse(numvalue1) / double.parse(numvalue2);

                        result = ans.toString();

                        setState(() {});
                      },
                      child: Text("Div")),
                  ElevatedButton(
                      onPressed: () {
                        var numvalue1 = num1.text.toString();
                        var numvalue2 = num2.text.toString();

                        double ans =
                            double.parse(numvalue1) - double.parse(numvalue2);

                        result = ans.toString();

                        setState(() {});
                      },
                      child: Text("Sub")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(result)
            ],
          ),
        ),
      ),
    );
  }
}

class HomeTwo extends StatefulWidget {
  const HomeTwo({super.key});

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  var res = "";

  void clearkardo() {
    setState(() {
      res = "";
    });
  }

  void equalkardo() {
    Parser parser = Parser();

    Expression expression = parser.parse(res);

    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      res = eval.toString();
    });
  }

  Widget btn(text) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            res += text;
          });
        },
        child: Text(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Math EXP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            res,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("+"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btn("4"),
              btn("5"),
              btn("6"),
              btn("-"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btn("7"),
              btn("8"),
              btn("9"),
              btn("*"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btn("0"),
              ElevatedButton(onPressed: clearkardo, child: Text("C")),
              btn("/"),
            
            ElevatedButton(onPressed: equalkardo, child: Text("=")),
            ],
          )
        ],
      ),
    );
  }
}
