import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Home.dart';
import 'package:lecture29firebase_dbms/Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
                SizedBox(
              height: 30,
            ),
            TextField(
              controller: username,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: useremail,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: userpass,
            ),
                SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                },
                child: Text("Signup")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
