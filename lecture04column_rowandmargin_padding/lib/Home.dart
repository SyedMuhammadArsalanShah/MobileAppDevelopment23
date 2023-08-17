import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Text("Ammarah"),
            Text("Hassan"),
            Text("Munsarim"),
            Text("Aminah"),
            Text("Affan"),
            Text("Ammarah"),
            Text("Hassan"),
            ElevatedButton(onPressed: (){}, child: Text(" next page")),
            Text("Munsarim"),
            Text("Aminah"),
            Text("Affan"),
            Text("Ammarah"),
            Text("Hassan"),
            Text("Munsarim"),
            Text("Aminah"),
            Text("Affan"),
            Text("Ammarah"),
            Text("Hassan"),
            Text("Munsarim"),
            Text("Aminah"),
            Text("Affan"),
          ]),
    ));
  }
}
