import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAPIDelet extends StatefulWidget {
  const DeleteAPIDelet({super.key});

  @override
  State<DeleteAPIDelet> createState() => _DeleteAPIDeletState();
}

class _DeleteAPIDeletState extends State<DeleteAPIDelet> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // i have added init state in delete API folder
    super.initState();
  }

  late SharedPreferences pref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "john@gmail.com",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "**********",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                //deleteApi();
                await signInWithEmailPassword("ali@gmail.com", "Ali123!@");
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void deleteApi() async {
    try {
      var response = await http.delete(
        Uri.parse("https://api.restful-api.dev/objects/"),
      );
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Sucess : ${response.statusCode} : ${json.decode(response.body)['message']}")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "Failed : ${response.statusCode} : : ${json.decode(response.body)['error']}")));
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If the user sign up successfully, you can do additional operations here.
      print('User signed up successfully!');
    } catch (e) {
      // If an error occurs during sign up, you can handle it here.
      print('Error occurred while signing up: $e');
    }
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // If the user signs in successfully, you can do additional operations here.
      print(
          'User signed in successfully! ${FirebaseAuth.instance.currentUser!.uid}');
      //await FirebaseAuth.instance.signOut();
    } catch (e) {
      // If an error occurs during sign in, you can handle it here.
      print('Error occurred while signing in: $e');
    }
  }
}
