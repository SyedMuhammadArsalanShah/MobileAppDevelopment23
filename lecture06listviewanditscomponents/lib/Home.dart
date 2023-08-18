import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as quran;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
          Text("Ammarah"),
          Text("Hassan"),
          Text("Munsarim"),
          Text("Arsalan"),
        ],
        scrollDirection: Axis.vertical,
        reverse: true,
      ),
    );
  }
}

var students = ["warisha", "fatimah", "hassan", "ammarah", "munsarim"];
var studentage = ["12", "03", "12", "4", "8"];

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.amber,
              title: Text("${students[index]}"),
              subtitle: Text("${studentage[index]}"),
              leading: Text("${index}"),
              trailing: Text("${index}"),
            ),
          );
        },
        itemCount: students.length,
        itemExtent: 100,
      ),
    );
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${students[index]}"),
              subtitle: Text("${studentage[index]}"),
              leading: Text("${index}"),
              trailing: Text("${index}"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 30,
              thickness: 2,
              color: Colors.indigo[900],
            );
          },
          itemCount: students.length),
    );
  }
}

// Quranic Surah List

class Quranic extends StatefulWidget {
  const Quranic({super.key});

  @override
  State<Quranic> createState() => _QuranicState();
}

class _QuranicState extends State<Quranic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Surah(index + 1),
                  ));
            },
            tileColor: Colors.blue,
            title: Text(quran.getSurahNameArabic(index + 1)),
            subtitle: Text(quran.getSurahNameEnglish(index + 1)),
            leading: Text("${index + 1}"),
            trailing: Text("${quran.getVerseCount(index + 1)}"),
          );
        },
        itemCount: quran.totalSurahCount,
      ),
    );
  }
}

class Surah extends StatefulWidget {
  int indexsurah;
  Surah(this.indexsurah, {super.key});

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: quran.getVerseCount(widget.indexsurah),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            quran.getVerse(widget.indexsurah, index + 1, verseEndSymbol: true),
            style: TextStyle(fontFamily: "jameel"),
            textAlign: TextAlign.right,
          ),
        );
      },
    ));
  }
}
