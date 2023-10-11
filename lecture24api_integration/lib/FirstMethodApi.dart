import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FirstMethodApi extends StatefulWidget {
  const FirstMethodApi({super.key});

  @override
  State<FirstMethodApi> createState() => _FirstMethodApiState();
}

class _FirstMethodApiState extends State<FirstMethodApi> {
  getapiinfo() async {
    var users = [];

    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

    var  jsondata = jsonDecode(response.body);

    print("smas => $jsondata");

    for (var i in jsondata) {
      UserModel user = UserModel(i["id"], i["name"], i["address"]["street"]);

      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getapiinfo(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:Text(snapshot.data[index].a.toString()) ,
                title: Text(snapshot.data[index].b),
                subtitle: Text(snapshot.data[index].c),
              );
            },
          );
        }
      },
    )

        // Center(
        //     child:
        //         ElevatedButton(onPressed: getapiinfo(), child: Text("get data"))),
        );
  }
}

class UserModel {
  var a;
  var b;
  var c;

  UserModel(this.a, this.b, this.c);
}
