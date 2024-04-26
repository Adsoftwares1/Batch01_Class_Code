import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/models/PublicApiModel.dart';

class UserApi extends StatefulWidget {
  const UserApi({super.key});

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<PublicApiModel> myList = [];

  List<String> latitude = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDataFromApi();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: latitude.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${latitude[index]}"),
              subtitle: Text("${latitude[index]}"),

              //leading: Text("Hello"),
            );
          }),
    );
  }

  Future<void> getDataFromApi() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        final List<dynamic> myJsonData = json.decode(response.body);

        /////////////////////////////
        print("Sucess1");
        for (var entry in myJsonData) {
          //myList.add(PublicApiModel.fromJson(entry));
          latitude.add(entry['address']['geo']['lat']);
        }
        print("Sucess2: ${latitude.length}");
        //print("My List Length ${commonNames.length}");
      } else {
        print("Invlid Api");
      }
    } catch (e) {
      print("Error in Api: $e");
    }
  }
}
