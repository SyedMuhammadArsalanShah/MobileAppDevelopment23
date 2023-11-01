import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lecture27hadith_api/Hadiths.dart';

// ignore: must_be_immutable
class HadithChapters extends StatefulWidget {
  var bookSlug;
  HadithChapters(this.bookSlug, {super.key});

  @override
  State<HadithChapters> createState() => _HadithChaptersState();
}

class _HadithChaptersState extends State<HadithChapters> {
  late Map rawdatamap = {};
  late List datalist = [];
  void getapi() async {
    var slug = widget.bookSlug;
    var apiKey =
        "\$2y\$10\$BylaBcXs5Lw7ZOtYmQ3PXO1x15zpp26oc1FeGktdmF6YeYoRd88e";
    var res = await http.get(
        Uri.parse("https://hadithapi.com/api/$slug/chapters?apiKey=$apiKey"));

// print("SMASB" + res.body);

    if (res.statusCode == 200) {
      setState(() {
        rawdatamap = jsonDecode(res.body);
        datalist = rawdatamap["chapters"];
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
      appBar: AppBar(
        title: Text(
          "Hadith Books Chapters",
          style: TextStyle(color: Color(0XFFF2F2F2)),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFF0D0D0D),
      ),
      body: datalist.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      var bookSlug = datalist[index]["bookSlug"];
                      var chapterNumber = datalist[index]["chapterNumber"];
                
                      print(bookSlug + chapterNumber);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Hadiths(bookSlug, chapterNumber),
                          ));
                    },
                    tileColor:  Color(0XFFF2F2F2),
                      textColor: Color(0XFF404040),
                    title: Text(
                      datalist[index]["chapterArabic"].toString(),
                      style: TextStyle(fontFamily: "alq",fontSize: 20),
                    ),
                    subtitle: Text(datalist[index]["chapterEnglish"].toString(),
                    style: TextStyle(fontSize: 16)
                    
                    ),
                    leading: Text("${index + 1}"),
                    trailing: Text(
                      datalist[index]["chapterUrdu"].toString(),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: "jameel",fontSize: 20)
                    ),
                  ),
                );
              },
              itemCount: datalist.length,
            ),
             backgroundColor: Color(0XFFD9D9D9),
    );
  }
}
