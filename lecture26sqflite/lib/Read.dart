import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lecture26sqflite/Services/Db_helper.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List<Map<String, dynamic>> datalist = [];

  void alldata() async {
    var query = await Db_helper.instance.queryDatabase();
    setState(() {
      datalist = query;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    alldata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
                title: Text(datalist[index]["name"].toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          Db_helper.instance
                              .deleteRecord(datalist[index]["id"]);
                          alldata();
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              );
      },
      itemCount: datalist.length,
    ));
  }
}
