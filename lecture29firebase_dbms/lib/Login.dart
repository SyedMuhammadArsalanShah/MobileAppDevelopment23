import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/HomeFirestore.dart';
import 'package:lecture29firebase_dbms/ImageScreenDB.dart';
import 'package:lecture29firebase_dbms/Signup.dart';
import 'package:lecture29firebase_dbms/Toast_msg.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Toast_msg obj =new Toast_msg();
  TextEditingController useremaillogin = TextEditingController();
  TextEditingController userpasslogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: useremaillogin,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: userpasslogin,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: useremaillogin.text.toString(),
                            password: userpasslogin.text.toString())
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => HomeFirestore(),
                            builder: (context) => ImageScreenDB(),
                          ));
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      obj.showMsg('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      obj.showMsg('Wrong password provided for that user.');
                    }
                  }
                },
                child: Text("SignIn")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                child: Text("Signup")),
          ],
        ),
      ),
    );
  }
}
