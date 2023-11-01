import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lecture25api_quran/Quran.dart';

class Surahs extends StatefulWidget {
  const Surahs({super.key});

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  late String raw = "";
  late Map rawMap = {};
  late List surahlist = [];

  getapi() async {
    var response =
        await http.get(Uri.parse("https://api.alquran.cloud/v1/meta"));

    if (response.statusCode == 200) {
      setState(() {
        raw = response.body;
        print("my Surah List" + raw);
        rawMap = jsonDecode(response.body);
        surahlist = rawMap["data"]["surahs"]["references"];
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

          if (data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Quran(data["number"]),
                    ));
              },
              tileColor: Colors.teal,
              textColor: Colors.white,
              leading: Text(data["number"].toString()),
              title: Text(
                data["name"],
                style: TextStyle(fontFamily: "alq"),
              ),
              subtitle: Text(data["englishNameTranslation"]),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data["numberOfAyahs"].toString()),
                  data["revelationType"].toString() == "Meccan"
                      ? Image.asset(
                          "images/kaaba.png",
                          width: 30,
                          height: 30,
                        )
                      : Image.asset(
                          "images/madina.png",
                          width: 30,
                          height: 30,
                        )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
