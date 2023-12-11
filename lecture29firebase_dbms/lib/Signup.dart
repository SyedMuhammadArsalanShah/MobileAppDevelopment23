import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Home.dart';
import 'package:lecture29firebase_dbms/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lecture29firebase_dbms/Toast_msg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Toast_msg obj = new Toast_msg();
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

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
              child: Text("Check Toast"),
              onPressed: () {
                obj.showMsg("this is my toast ");
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: useremail.text.toString(),
                      password: userpass.text.toString(),
                    )
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      obj.showMsg("The password provided is too weak.");
                    } else if (e.code == 'email-already-in-use') {
                      obj.showMsg("The account already exists for that email.");
                    }
                  } catch (e) {
                    obj.showMsg(e.toString());
                  }
                },
                child: Text("Signup")),
            ElevatedButton(
                onPressed: () async {
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
