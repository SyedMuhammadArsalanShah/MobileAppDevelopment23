import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lecture24api_integration/Api.dart';

late String rawdata;
late Map mapresponse;
late List listresponse;

class ThirdMethodApi extends StatefulWidget {
  const ThirdMethodApi({super.key});

  @override
  State<ThirdMethodApi> createState() => _ThirdMethodApiState();
}

class _ThirdMethodApiState extends State<ThirdMethodApi> {
  Api myapi = Api();

  bool isloading = true;

  Future<void> fetchdata() async {
    try {
      await myapi.getuserdata();

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("my api is failed $e");
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isloading
            ? Center(
                child: RefreshProgressIndicator(),
              )
            : ListView.builder(
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
