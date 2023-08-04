import 'package:flutter/material.dart';

import 'NextPage.dart';

class Allbutton extends StatelessWidget {
  const Allbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //   ElevatedButton(
            //       onPressed: () {}, child: Text("Raised Button ->Elevated Button")),
            // );

            // TextButton(onPressed: () {}, child: Text("Flat ->Text button")),

            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(),
                      ));
                },
                child: Text("Outline -> Outlined Button")));
  }
}
