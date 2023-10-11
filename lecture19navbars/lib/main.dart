import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ThirdDrawer(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;

  final List<Widget> _pages = [
    // Define your pages here
    Second(),
    Page('Page 2 Content'),
    Page('Page 3 Content'),
    Page('Page 4 Content'),
  ];

  void ammarah(int index) {
    setState(() {});
    selectedindex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedindex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: selectedindex,

        marginR: const EdgeInsets.symmetric(horizontal: 50),
        paddingR: const EdgeInsets.only(bottom: 5),

        // selectedItemColor: Colors.white,

        splashColor: Colors.transparent,
        backgroundColor: Colors.black54,
        onTap: ammarah,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            selectedColor: Colors.orange,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
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
    return Container(
      width: double.infinity,
      height: 800,
      color: Colors.blue[800],
      child: Center(
        child: Text("Munsarim"),
      ),
    );
  }
}

class Page extends StatefulWidget {
  String Content;
  Page(this.Content, {super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.Content)),
    );
  }
}

class ThirdDrawer extends StatefulWidget {
  const ThirdDrawer({super.key});

  @override
  State<ThirdDrawer> createState() => _ThirdDrawerState();
}

class _ThirdDrawerState extends State<ThirdDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true ,
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            child: Image.network(
                "https://cdn.shopify.com/s/files/1/0490/2443/4341/files/tiles_800x800_crop_center.jpg?v=1673243940"),
          )),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Second()));
              },
              child: ListTile(
                title: Text("Range slider"),
              )),
          ListTile(
            title: Text("Contact us"),
          ),
          ListTile(
            title: Text("About us"),
          ),
        ],
      )),
    );
  }
}
