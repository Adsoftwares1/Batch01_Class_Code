import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:practice_app_class/task_27/show_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithAPI extends StatefulWidget {
  const LoginWithAPI({super.key});

  @override
  State<LoginWithAPI> createState() => _LoginWithAPIState();
}

class _LoginWithAPIState extends State<LoginWithAPI> {
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
              child: Center(
                child: TextButton(
                    onPressed: () {
                      print("Api Hit");
                      hitApi();
                    },
                    child: Text("HIT API")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void hitApi() async {
    try {
      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: {"email": "eve.holt@reqres.in", "password": "cityslicka"});

      Map<String, dynamic> myDecodedResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        print("My response : ${myDecodedResponse['token']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
