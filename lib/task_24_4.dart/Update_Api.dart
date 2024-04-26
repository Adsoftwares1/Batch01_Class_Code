import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PutAPI extends StatefulWidget {
  const PutAPI({super.key});

  @override
  State<PutAPI> createState() => _PutAPIState();
}

class _PutAPIState extends State<PutAPI> {
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
                update();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void update() async {
    try {
      var response = await http.put(Uri.parse("https://reqres.in/api/users/2"),
          body: {"name": "Junaid Khan", "job": "Professor"});
      if (response.statusCode == 200) {
        String name = json.decode(response.body)['name'];
        String job = json.decode(response.body)['job'];
        String time = json.decode(response.body)['updatedAt'];
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Data updated sucess : $name : $job : $time")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Data updated Failed")));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
