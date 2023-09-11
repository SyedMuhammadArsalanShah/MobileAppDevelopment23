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
      home: const Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List<dynamic> students = [];
  var output = "";
  var updatecont = TextEditingController();
  var addcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Simple To Do App"),
        centerTitle: true,
        backgroundColor: Colors.purple[700],
        foregroundColor: Colors.white,
      ),

      // insert data from here
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // clear textfield
          addcont.clear();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add To Task"),
                content: TextField(
                  controller: addcont,
                  onChanged: (value) {
                    output = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        // add data into list
                        students.add(output);
                        setState(() {});
                        Navigator.of(context).pop();

                        // Navigator.pop(context);
                      },
                      child: Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        // for back screen
                        Navigator.of(context).pop();

                        // Navigator.pop(context);
                      },
                      child: Text("Cancel"))
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.green[400],
        ),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.purple[900],
              textColor: Colors.white,
              title: Text(
                students[index].toString(),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                       // updated index value show on text field
                      updatecont.text = students[index].toString();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Update your Task"),
                            content: TextField(
                              controller: updatecont,
                              onChanged: (value) {
                                output = value;
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    // add data into list

                                    print("am=> ${students[index]}");

                                    students.replaceRange(
                                        index, index + 1, {output});
                                    setState(() {});
                                    Navigator.of(context).pop();

                                    // Navigator.pop(context);
                                  },
                                  child: Text("Update")),
                              ElevatedButton(
                                  onPressed: () {
                                    // for back screen
                                    Navigator.of(context).pop();

                                    // Navigator.pop(context);
                                  },
                                  child: Text("Cancel"))
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      students.removeAt(index);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
