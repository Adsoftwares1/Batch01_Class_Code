import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_app_class/task_27/show_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertImageIntoSharedPreferences extends StatefulWidget {
  const InsertImageIntoSharedPreferences({super.key});

  @override
  State<InsertImageIntoSharedPreferences> createState() =>
      _InsertImageIntoSharedPreferencesState();
}

class _InsertImageIntoSharedPreferencesState
    extends State<InsertImageIntoSharedPreferences> {
  late SharedPreferences pref;
  XFile? mySelectedImage;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Image"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: mySelectedImage != null
                  ? Image.file(File(mySelectedImage!.path))
                  : Icon(
                      Icons.person,
                      size: 100,
                    ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Select Image Source"),
                        content: Container(
                          height: 200,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  picImageFromGallery();
                                  Navigator.of(context).pop();
                                },
                                child: Text("Slect Image from Gallery"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    picImageFromCamera();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Select Image from Camera")),
                            ],
                          ),
                        ),
                      );
                    });

                // await Future.delayed(Duration(seconds: 10), () {

                // });
              },
              child: Text("Pick Image"),
            ),
          ],
        ),
      ),
    );
  }

  // functon to pick image from gallery
  void picImageFromGallery() async {
    final myImage = await picker.pickImage(source: ImageSource.gallery);
    if (myImage != null) {
      mySelectedImage = XFile(myImage.path);
      pref = await SharedPreferences.getInstance();
      pref.setString("imagePath", myImage.path);
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DisplayImage();
        }));
      });
    } else {
      print("Image not Selected");
    }
  }

  void picImageFromCamera() async {
    final myImage = await picker.pickImage(source: ImageSource.camera);
    if (myImage != null) {
      mySelectedImage = XFile(myImage.path);
      pref.setString("imagePath", myImage.path);
      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DisplayImage();
        }));
      });
    } else {
      print("Image not Selected");
    }
  }
}
