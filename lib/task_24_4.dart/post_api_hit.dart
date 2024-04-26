import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPostAPI extends StatefulWidget {
  const LoginPostAPI({super.key});

  @override
  State<LoginPostAPI> createState() => _LoginPostAPIState();
}

class _LoginPostAPIState extends State<LoginPostAPI> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

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
              onPressed: () {
                login();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": "${_emailController.text}",
            "password": "${_passwordController}"
          });
      if (response.statusCode == 200) {
        var myResponseData = json.decode(response.body)['token'];
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sucess : ${myResponseData}")));
      } else {
        var MyresponseData = json.decode(response.body)['error'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("Failed : ${response.statusCode} : ${MyresponseData}")));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
