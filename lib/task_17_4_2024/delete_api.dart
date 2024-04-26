import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DeleteApi extends StatefulWidget {
  const DeleteApi({super.key});

  @override
  State<DeleteApi> createState() => _DeleteApiState();
}

class _DeleteApiState extends State<DeleteApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              delteData();
            },
            child: Text("Delete Data")),
      ),
    );
  }

  void delteData() async {
    try {
      var response = await http.delete(Uri.parse(
          'https://api.restful-api.dev/objects/ff8081818eeb2234018eec28b3ea04f8'));

      if (response.statusCode == 200) {
        var myResponseData = json.decode(response.body);
        print("Delete Sucess :  ${myResponseData['message']}");
      } else {
        var myResponseData = json.decode(response.body);
        print("Delete Failed :  ${myResponseData['error']}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
