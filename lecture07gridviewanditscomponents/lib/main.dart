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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      // home: const Second(),
      // home: const Third(),
      home: const Five(),
    );
  }
}

var arraycolors = [
  Colors.amber,
  Colors.indigo,
  Colors.indigo[900],
  Colors.blue,
  Colors.teal,
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 12,
        children: [
          Container(
            color: arraycolors[0],
          ),
          Container(
            color: arraycolors[1],
          ),
          Container(
            color: arraycolors[2],
          ),
          Container(
            color: arraycolors[3],
          ),
          Container(
            width: 100,
            color: arraycolors[4],
          ),
        ],
      ),
    );
  }
}

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 100,
        children: [
          Container(
            color: arraycolors[0],
          ),
          Container(
            color: arraycolors[1],
          ),
          Container(
            color: arraycolors[2],
          ),
          Container(
            color: arraycolors[3],
          ),
          Container(
            width: 100,
            color: arraycolors[4],
          ),
        ],
      ),
    );
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          // for count
          // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          // for extent / size
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Fourth(),
                ));
          },
          child: Container(
            color: arraycolors[index],
          ),
        );
      },
      itemCount: arraycolors.length,
    ));
  }
}

class Fourth extends StatefulWidget {
  const Fourth({super.key});

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
              radius: 60,
              backgroundColor: arraycolors[index],
              child: Text("${index}")),
          title: Text("${arraycolors[index]}"),
        );

        // return CircleAvatar(
        //     radius: 100,
        //     backgroundColor: arraycolors[index],
        //     child: Text("${index}"));
      },
      itemCount: arraycolors.length,
    ));
  }
}

class Five extends StatefulWidget {
  const Five({super.key});

  @override
  State<Five> createState() => _FiveState();
}

class _FiveState extends State<Five> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
              width: 100,
              height: 100,
              color: arraycolors[0],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[1],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[2],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[3],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[4],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[3],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[4],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[0],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[1],
            ),
            Container(
              width: 100,
              height: 100,
              color: arraycolors[2],
            ),
          ],
        ),
      ),
    );
  }
}
