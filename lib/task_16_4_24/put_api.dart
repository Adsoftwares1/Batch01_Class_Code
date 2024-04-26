import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PUTAPI extends StatefulWidget {
  const PUTAPI({super.key});

  @override
  State<PUTAPI> createState() => _PUTAPIState();
}

class _PUTAPIState extends State<PUTAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              updateData();
            },
            child: Text("Update Data")),
      ),
    );
  }

  void updateData() async {
    try {
      var response = await http.patch(
          Uri.parse('https://reqres.in/api/users/2'),
          body: {"name": "Shayan", "job": "zion Shayan khan"});

      if (response.statusCode == 200) {
        var myResponseData = json.decode(response.body);
        print("Update Sucess ${myResponseData['name']}");
      } else {
        print("Update Failed");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
