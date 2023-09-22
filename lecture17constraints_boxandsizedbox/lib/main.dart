import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const Second(),
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
      body: ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 100, minWidth: 100, maxWidth: 400, maxHeight: 400),
        child: Container(
          width: 600,
          height: 600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Munsarim")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Musab")),
            // SizedBox(
            //   width: 300, height: 100,
            //   child: ElevatedButton(onPressed: () {}, child: Text("AMmarah")),
            // ),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 0),
              child: SizedBox.expand(
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Hassaan Ahmed")),
              ),
            ),

            ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 100, minHeight: 100),
                child: SizedBox.shrink(
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Hasan Ahmed")),
                )),
            ConstrainedBox(
                constraints: const BoxConstraints(),
                child: SizedBox.square(
                  child: ElevatedButton(onPressed: () {}, child: Text("Ahmed")),
                )),
          ],
        ));
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // full width
          // width: double.infinity,
          // height: double.infinity,

          width: 500,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202307/pakistan-flag-one_one.jpg?VersionId=BiMlDaSqtdR3V3J0tR8Gx2mV9CfNvyZx")),
            // color: Colors.blue,

            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(
                color: const Color.fromARGB(255, 1, 24, 43), width: 2)
            //  BorderRadius.only(topLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
            ,
            boxShadow: [
              BoxShadow(
                blurRadius: 21,

                color: Colors.indigo,

                //  spreadRadius: 2
              )
            ],
            // shape: BoxShape.circle
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.facebook),
                FaIcon(FontAwesomeIcons.instagram),
                SizedBox(
                  height: 300,
                ),
                Card(
                  color: Colors.green,
                  child: ListTile(
                    tileColor: Colors.black,
                    leading: Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
