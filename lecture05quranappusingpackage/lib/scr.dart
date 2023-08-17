import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as munsarim;
import 'Surahs.dart';

class Scr extends StatefulWidget {
  const Scr({super.key});

  @override
  State<Scr> createState() => _ScrState();
}

class _ScrState extends State<Scr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Surahs(index+1),));
              },
              tileColor: Colors.indigo[900],
              leading: Text(
                "${index + 1}",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "${munsarim.getSurahNameEnglish(index + 1)}",
                style: TextStyle(color: Colors.white),
              ),
              title: Text(
                "${munsarim.getSurahName(index + 1)}",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                "Verses : ${munsarim.getVerseCount(index + 1)}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemCount: munsarim.totalSurahCount,
      ),
    );
  }
}
