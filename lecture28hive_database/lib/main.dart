import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("taskbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  var taskbox = Hive.box("taskbox");

  List<Map<String, dynamic>> myalldata = [];

  void createdata(Map<String, dynamic> data) async {
    taskbox.add(data);
    readdata();
    print("my hive db length =>${taskbox.length}");
  }

  void updatedata(Map<String, dynamic> data, key) async {
    taskbox.put(key, data);
    readdata();

  }

  readdata() {
    var data = taskbox.keys.map((indexelement) {
      final dataitem = taskbox.get(indexelement);
      return {
        "key": indexelement,
        "title": dataitem["title"],
        "desc": dataitem["desc"]
      };
    }).toList();

    setState(() {
      myalldata = data.reversed.toList();

      print(myalldata);
    });
  }

  deletedata(int? key) async {
    await taskbox.delete(key);

    readdata();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readdata();
  }

  void showmodel(context, int? key) {
    titleController.clear();
    descController.clear();

    if (key != null) {
      final item = myalldata.firstWhere((element) => element["key"] == key);
      titleController.text = item["title"];
      descController.text = item["desc"];
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              32, 32, 32, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Your Title "),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: "Enter Your Description"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    var data = {
                      "title": titleController.text.toString(),
                      "desc": descController.text.toString(),
                    };

                    if (key != null) {
                      updatedata(data, key);
                    } else {
                      createdata(data);
                    }
                    Navigator.pop(context);
                  },
                  child: key != null ? Text("Update") : Text("Add")),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showmodel(context, null);
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Hive Database (NO SQL) "),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(myalldata[index]["title"]),
              subtitle: Text(myalldata[index]["desc"]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        showmodel(context, myalldata[index]["key"]);
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        deletedata(myalldata[index]["key"]);
                      },
                      icon: Icon(Icons.delete))
                ],
              ),
            );
          },
          itemCount: myalldata.length,
        ));
  }
}
