import 'package:flutter/material.dart';

class Customwid {





  
  Widget merabutton(String value) {
    return ElevatedButton(child: Text(value), onPressed: () {});
  }

  Widget textwid(String value) {
    return Center(
      child: Text(
        value,
        style: TextStyle(
            color: Colors.indigo[900], fontSize: 40, fontFamily: "alquran3"),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget meralistview(value, titlee, subtitlee, color) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: value.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            tileColor: color,
            textColor: Colors.white,
            title: Text(titlee[index]),
            subtitle: Text(subtitlee[index].toString()),
          ),
        );
      },
    ));
  }

  Widget meralistviewcon(value, titlee, axix, color) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: axix,
      itemCount: value.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            color: color,
            width: 300,
            height: 300,
            child: Center(child: Text(titlee[index], style: TextStyle(
            color: Colors.white, fontSize: 40, fontFamily: "alquran3"),
        textAlign: TextAlign.center,)),
          ),
        );
      },
    ));
  }
}
