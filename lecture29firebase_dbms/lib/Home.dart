import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lecture29firebase_dbms/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:lecture29firebase_dbms/Toast_msg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference ref = FirebaseDatabase.instance.ref("myusers");

  final key = FirebaseAuth.instance.currentUser!.uid;

  int id = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController searchValue = TextEditingController();

  showformmodel(context, int? postid) async {
    titleController.clear();
    descController.clear();

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
                  onPressed: () async {
                    if (postid == null) {
                      id++;
                      ref.child(key).child("$id").set({
                        "id": id,
                        "dateofpost": DateTime.now().toString(),
                        "title": titleController.text.toString(),
                        "desc": descController.text.toString()
                      }).then((value) {
                        Toast_msg().showMsg("Successfully covered");
                      }).onError((error, stackTrace) {
                        Toast_msg().showMsg(error.toString());
                      });
                    } else {
                      ref.child(key).child("$postid").update({
                        "id": postid,
                        "dateofpost": DateTime.now().toString(),
                        "title": titleController.text.toString(),
                        "desc": descController.text.toString()
                      }).then((value) {
                        Toast_msg().showMsg("Successfully updated");
                      }).onError((error, stackTrace) {
                        Toast_msg().showMsg(error.toString());
                      });
                    }

                    Navigator.pop(context);
                  },
                  child:
                      postid == null ? Text("Add Post") : Text("Update Post")),
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                  );
                },
                icon: Icon(Icons.logout))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showformmodel(context, null);
            },
            child: Icon(Icons.add)),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchValue,
                decoration: InputDecoration(
                    label: Text("Search BY Title"),
                    hintText: "Search Here ......"),
                onChanged: (String value) {
                  setState(() {});
                },
              ),
            ),

            Expanded(
              
              child: StreamBuilder(
                stream: ref.child(key).onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> item = map.values.toList();
                    return ListView.builder(
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(item[index]["title"].toString()),
                          subtitle: Text(item[index]["desc"].toString()),
                        );
                      },
                    );
                  }
                },
              ),
            )

            // Expanded(
            //   child: FirebaseAnimatedList(
            //     query: ref.child(key),
            //     itemBuilder: (context, snapshot, animation, index) {
            //       final title = snapshot.child("title").value.toString();

            //       if (searchValue.text.isEmpty) {
            //         return ListTile(
            //           title: Text(snapshot.child("title").value.toString()),
            //           subtitle: Text(snapshot.child("desc").value.toString()),
            //           trailing: Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               IconButton(
            //                   onPressed: () {
            //                     final postid =
            //                         snapshot.child("id").value.toString();
            //                     showformmodel(context, int.parse(postid));
            //                   },
            //                   icon: Icon(Icons.edit)),
            //               IconButton(
            //                   onPressed: () {
            //                     final deleteid =
            //                         snapshot.child("id").value.toString();
            //                     ref.child(key).child(deleteid).remove();
            //                   },
            //                   icon: Icon(Icons.delete)),
            //             ],
            //           ),
            //         );
            //       } else if (title.contains(searchValue.text.toString())) {
            //         return ListTile(
            //           title: Text(snapshot.child("title").value.toString()),
            //           subtitle: Text(snapshot.child("desc").value.toString()),
            //         );
            //       } else {
            //         return Center(
            //           child: Container(
            //             width: double.infinity,
            //             height: double.infinity,
            //             color: Colors.indigo[900],
            //             child: Center(
            //               child: Text(
            //                 "Welcome In our home \n آپ کو  خوش آمدید ",
            //                 style: TextStyle(color: Colors.white, fontSize: 30),
            //                 textAlign: TextAlign.right,
            //               ),
            //             ),
            //           ),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        )
        //  Center(
        //   child: Container(
        //     width: double.infinity,
        //     height: double.infinity,
        //     color: Colors.indigo[900],
        //     child: Center(
        //       child: Text(
        //         "Welcome In our home \n آپ کو  خوش آمدید ",
        //         style: TextStyle(color: Colors.white, fontSize: 30),
        //         textAlign: TextAlign.right,
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
