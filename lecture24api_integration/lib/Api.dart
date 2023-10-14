import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  late String rawdata;
  late Map mapresponse;
  late List listresponse;
  getuserdata() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    print(response.body);

    if (response.statusCode == 200) {
      rawdata = response.body.toString();

      mapresponse = jsonDecode(response.body);

      listresponse = mapresponse["data"];
    }
  }
}
