import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

late String rawdata;
late Map mapresponse;
late List listresponse;

class SecondMethodApi extends StatefulWidget {
  const SecondMethodApi({super.key});

  @override
  State<SecondMethodApi> createState() => _SecondMethodApiState();
}

class _SecondMethodApiState extends State<SecondMethodApi> {
  bool isloading = true;

  getuserdata() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    print(response.body);

    if (response.statusCode == 200) {
      setState(() {
        rawdata = response.body.toString();

        mapresponse = jsonDecode(response.body);

        listresponse = mapresponse["data"];

        isloading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading
            ? Center(
                child: RefreshProgressIndicator(),
              )
            :
            // Center(
            //     child: Container(
            //       width: 500,
            //       height: 800,
            //       child:

            //           //  Text(rawdata.toString()),
            //           Text(
            //         // mapresponse["support"]["url"].toString(),
            //         listresponse[3]["id"].toString(),
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       color: Colors.black,
            //     ),
            //   ),

            ListView.builder(
                itemCount: listresponse.length,
                itemBuilder: (context, index) {
                  var data = listresponse[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data["avatar"]),
                    ),
                    title: Text(data["first_name"]),
                    subtitle: Text(data["email"]),
                    trailing: Text(data["id"].toString()),
                  );
                },
              ));
  }
}
