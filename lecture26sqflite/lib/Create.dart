import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lecture26sqflite/Services/Db_helper.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: nameController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                var name = nameController.text.toString();

                await Db_helper.instance.insertRecord({Db_helper.dt_name: name});
                setState(() {
                  
                });


                 Navigator.of(context).pop();
              },
              child: Text("Create"))
        ]),
      ),
    );
  }
}
