import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayImage extends StatefulWidget {
  DisplayImage({super.key});

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  late SharedPreferences pref;
  ImagePicker picker = ImagePicker();
  String myImagePathFromSharedPreferneces = '';

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      pref = await SharedPreferences.getInstance();
      if (pref.getString("imagePath") != null) {
        setState(() {
          myImagePathFromSharedPreferneces = pref.getString("imagePath")!;
          print("My image Path : $myImagePathFromSharedPreferneces");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Print in build : $myImagePathFromSharedPreferneces");
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Image"),
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
              child: myImagePathFromSharedPreferneces != null
                  ? Image.file(File(myImagePathFromSharedPreferneces))
                  : Icon(
                      Icons.person,
                      size: 100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
