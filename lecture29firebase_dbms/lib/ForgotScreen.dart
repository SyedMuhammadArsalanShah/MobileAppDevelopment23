import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Toast_msg.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailcontroller,
          ),
          ElevatedButton(
              onPressed: () {
                auth
                    .sendPasswordResetEmail(
                        email: emailcontroller.text.toString())
                    .then((value) {
                  Toast_msg().showMsg("email linked enable");
                }).onError((error, stackTrace) {
                  Toast_msg().showMsg(error.toString());
                });
              },
              child: Text("Forget Email"))
        ],
      ),
    );
  }
}
