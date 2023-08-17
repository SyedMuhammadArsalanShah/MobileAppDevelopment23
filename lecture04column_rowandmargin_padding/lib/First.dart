import 'package:flutter/material.dart';
import 'package:lecture04column_rowandmargin_padding/Home.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Container(
                  width: 500,
                  height: 100,
                  color: Colors.indigo[900],
                  child: Text(
                    "Column Screen ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 500,
              height: 100,
              color: Colors.indigo[900],
              child: Text(
                "row Screen ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 500,
              height: 100,
              color: Colors.indigo[900],
              child: Text(
                "Margin Padding  Screen ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
