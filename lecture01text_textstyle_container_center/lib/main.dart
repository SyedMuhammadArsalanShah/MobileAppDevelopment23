import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: 100,
            // color: Colors.indigo[900],
          // color:Color(0xffF2E3D5),
          color: Color.fromARGB(255, 99, 24, 133),
              child: Text(
                "اللہ کے نام سے جو رحمان و رحیم ہے",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "jameel",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        
      ),
    );
  }
}
