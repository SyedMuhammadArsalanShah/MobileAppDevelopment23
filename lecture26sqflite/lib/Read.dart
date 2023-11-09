
import 'package:flutter/material.dart';
import 'package:lecture26sqflite/Services/Db_helper.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List<Map<String, dynamic>> datalist = [];
  TextEditingController nameController = TextEditingController();
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
              IconButton(
                  onPressed: () {
                    var id = datalist[index]["id"];

                    var name = datalist[index]["name"].toString();

                    update(id, name);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    Db_helper.instance.deleteRecord(datalist[index]["id"]);
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

  update(id, name) {
    nameController.text = name;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              32, 32, 32, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
              Column(mainAxisSize: MainAxisSize.min,
               children: [
                TextField(
                  controller: nameController,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var name = nameController.text.toString();

                      await Db_helper.instance.updateRecord(
                          {Db_helper.dt_id: id, Db_helper.dt_name: name});
                      alldata();
                      Navigator.of(context).pop();
                    },
                    child: Text("Update"))
              ]),
            ],
          ),
        );
      },
    );
  }
}
