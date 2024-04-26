import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithPostAPI extends StatefulWidget {
  const LoginWithPostAPI({super.key});

  @override
  State<LoginWithPostAPI> createState() => _LoginWithPostAPIState();
}

class _LoginWithPostAPIState extends State<LoginWithPostAPI> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                controller: emailController,
                decoration: InputDecoration(hintText: "john@gmail.com"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                print("API Hit");
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("email or password is missing")),
                  );
                } else {
                  login(emailController.text, passwordController.text);
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void login(String myEmail, String myPassword) async {
    try {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": myEmail, "password": myPassword});
      if (response.statusCode == 200) {
        print(
            "Login successful : my token is: ${json.decode(response.body)['token']}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Sucess")),
        );

        pref = await SharedPreferences.getInstance();
        pref.setString('mytoken', '${json.decode(response.body)['token']}');
      } else {
        print("Login Failed : ${json.decode(response.body)['error']}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Failed")),
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
