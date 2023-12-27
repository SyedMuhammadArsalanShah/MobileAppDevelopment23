import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecture29firebase_dbms/Toast_msg.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageScreenDB extends StatefulWidget {
  const ImageScreenDB({super.key});

  @override
  State<ImageScreenDB> createState() => _ImageScreenDBState();
}

class _ImageScreenDBState extends State<ImageScreenDB> {
  File? image;

  final imagePicker = ImagePicker();

  final storageRef = FirebaseStorage.instance.ref("imagesofsmas");

  DatabaseReference ref = FirebaseDatabase.instance.ref("myusers");
  final key = FirebaseAuth.instance.currentUser!.uid;

  int id = 0;

  Future getImagefromGallery() async {
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        Toast_msg().showMsg("No image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? Text("Here Is an Image ")
                : Image.file(image!.absolute),
            ElevatedButton(
                onPressed: () {
                  getImagefromGallery();
                },
                child: Text("Select Image")),
            ElevatedButton(
                onPressed: () async {
                  id++;

                  final refimg =
                      await storageRef.child("img").child("$key/$id");

                  UploadTask uploadTask = refimg.putFile(image!.absolute);

                  Future.value(uploadTask).then((value) async {
                    final downloadurl = await refimg.getDownloadURL();

                    print("Image Url WA910 => $downloadurl");

                    ref
                        .child(key)
                        .child("$id")
                        .set({"Id": id, "imageurl": downloadurl}).then((value) {
                      Toast_msg().showMsg("Image Uploaded in db");
                    }).onError((error, stackTrace) {
                      Toast_msg().showMsg(error.toString());
                    });

                    Toast_msg().showMsg("Image Uploaded");
                  }).onError((error, stackTrace) {
                    Toast_msg().showMsg(error.toString());
                  });
                },
                child: Text("Upload  Image")),
          ],
        ),
      ),
    );
  }
}
