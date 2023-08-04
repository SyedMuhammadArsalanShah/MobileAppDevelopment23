import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          onLongPress: () {},
          child: Text("Back Hojaien")),
    );
  }
}
