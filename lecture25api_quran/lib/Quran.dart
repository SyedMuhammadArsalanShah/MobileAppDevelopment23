import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Quran extends StatefulWidget {
  var number;
  Quran(this.number, {super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  late String raw = "";
  late Map rawMap = {};
  late List surahlist = [];

  getapi() async {
    var response = await http.get(Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani"));

    if (response.statusCode == 200) {
      setState(() {
        raw = response.body;
        print("my Surah List" + raw);
        rawMap = jsonDecode(response.body);
        surahlist = rawMap["data"]["surahs"][widget.number - 1]["ayahs"];
      });
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: surahlist.length,
        itemBuilder: (context, index) {
          var data = surahlist[index];
          return Card(
            child: ListTile(
              tileColor: Colors.white,
              textColor: Colors.teal,
              title: Text(
                data["text"].toString(),
                textDirection:TextDirection.rtl,
                style: TextStyle(fontFamily: "alq", fontSize: 30),
              ),
            ),
          );
        },
      ),
    );
  }
}
