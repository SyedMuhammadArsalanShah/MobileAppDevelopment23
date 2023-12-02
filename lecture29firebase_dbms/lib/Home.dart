import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigo[900],
          child: Center(
            child: Text(
              "Welcome In our home \n خوش آمدید ",
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
