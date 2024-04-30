import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/task_29_4_24/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  hintText: "New password",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Missing Email")));
                } else {
                  LoginWithEmailandPassword(
                      _emailController.text, _passwordController.text);
                }
                //deleteApi();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void LoginWithEmailandPassword(
      String emailPassed, String passwordPassed) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailPassed, password: passwordPassed);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" Login Sucess")));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Failed $e")));
    }
  }
}
