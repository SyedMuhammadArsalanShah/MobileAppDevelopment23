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
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Hassan Ka WhatsApp"),
            bottom: TabBar(
                labelColor: Colors.brown,
                indicatorColor: Colors.brown[600],
                unselectedLabelColor: Colors.blueGrey,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock),
                        Text("status"),
                      ],
                    ),
                    iconMargin: EdgeInsetsDirectional.only(start: 12),
                  ),
                  Tab(text: "Expanded"),
                  Tab(text: "calls"),
                  Tab(
                    text: "camera",
                    icon: Icon(Icons.camera_alt_rounded),
                  ),
                ]),
          ),
          body: TabBarView(children: [Status(), Chat(), Calls(), Camera()]),
        ));
  }
}

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Status"));
  }
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.amber,
          ),
        ),
        Expanded(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.teal,
          ),
        ),
        Expanded(
          child: Container(
            width: 250,
            height: 250,
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            width: 250,
            height: 250,
            color: Colors.blue,
          ),
        )
      ],
    ));
  }
}

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.amber,
              )),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.teal,
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 250,
              height: 250,
              color: Colors.green,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.blue,
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(" Camera"));
  }
}
