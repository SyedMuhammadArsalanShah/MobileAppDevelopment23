import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as munsarim;

// ignore: must_be_immutable
class Surahs extends StatefulWidget {
  int surahindex;
  Surahs(this.surahindex, {super.key});

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: munsarim.getVerseCount(widget.surahindex),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(munsarim.getVerse(widget.surahindex, index + 1),textAlign:TextAlign.right,textDirection: TextDirection.rtl,),
          );
        },
      ),
    );
  }
}
