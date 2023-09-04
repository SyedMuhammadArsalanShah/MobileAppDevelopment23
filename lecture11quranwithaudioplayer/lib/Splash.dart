import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Surahlist(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Holy Quran"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/images/quran.png",
            width: 100,
            height: 100,
          )),
          Center(
              child: Text(
            "Holy Quran",
            style: TextStyle(color: Colors.white),
          )),
        ],
      ),
      backgroundColor: Colors.brown[900],
    );
  }
}

class Surahlist extends StatefulWidget {
  const Surahlist({super.key});

  @override
  State<Surahlist> createState() => _SurahlistState();
}

class _SurahlistState extends State<Surahlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Holy Quran"),
      ),
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          return ListTile(
            textColor: Colors.white,
            tileColor: Colors.brown[900],
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Surah(index),
                  ));
            },
            title: Text(quran.getSurahNameArabic(index + 1)),
            subtitle: Text(quran.getSurahNameTurkish(index + 1)),
            leading: CircleAvatar(
              child:
                  Text("${index + 1}", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.brown[900],
            ),
            trailing: Text("${quran.getVerseCount(index + 1)}"),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Surah extends StatefulWidget {
  int indexsurah;
  Surah(this.indexsurah, {super.key});

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  AudioPlayer audioplayer = AudioPlayer();
  IconData playpauseButton = Icons.play_circle_fill_rounded;
  bool isplaying = false;

  Future<void> togglebutton() async {
    try {
      final audiourl = await quran.getAudioURLBySurah(widget.indexsurah + 1);
      audioplayer.setUrl(audiourl);
      print(audiourl);

      if (isplaying) {
        audioplayer.play();
        setState(() {
          playpauseButton = Icons.pause_circle_rounded;

          isplaying = false;
        });
      } else {
        audioplayer.pause();
        setState(() {
          playpauseButton = Icons.play_circle_fill_rounded;

          isplaying = true;
        });
      }
    } catch (e) {
      print("my error=>${e}");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose

    audioplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: quran.getVerseCount(widget.indexsurah + 1),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        quran.getVerse(widget.indexsurah + 1, index + 1,
                            verseEndSymbol: true),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            elevation: 6,
            shadowColor: Colors.brown[900],
            child: Center(
              child: IconButton(
                  icon: Icon(
                    playpauseButton,
                    color: Colors.brown[900],
                  ),
                  onPressed: togglebutton),
            ),
          ),
        ],
      ),
    );
  }
}
