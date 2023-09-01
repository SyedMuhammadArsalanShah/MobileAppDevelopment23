import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // // tested with just a hot reload.
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var username = TextEditingController();
  var passuser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text("Signup"),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: username,
                  // enabled: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("My suffix");
                        },
                        icon: Icon(Icons.info),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {
                          print("My suffix");
                        },
                        icon: Icon(Icons.mail, color: Colors.teal),
                      ),
                      hintText: "User Name Here",
                      helperText: "oops ! is not valid email",
                      labelText: "Username",
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12)))),
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passuser,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.grey, width: 2),
                    //     borderRadius:
                    //         BorderRadius.only(bottomLeft: Radius.circular(12))),
                    suffixIcon: IconButton(
                      onPressed: () {
                        print("My suffix");
                      },
                      icon: Icon(Icons.info),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        print("My suffix");
                      },
                      icon: Icon(Icons.mail, color: Colors.teal),
                    ),
                    hintText: "password Here",
                    helperText: "oops ! is not valid email",
                    labelText: "Username",
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(12))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(12))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(12)))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    var user = username.text.toString();
                    var pass = passuser.text.toString();

                    print("user name ${user}");
                    print("user pass ${pass}");
                  },
                  child: Text("SignIN"))
            ],
          ),
        ),
      ),
    );
  }
}
