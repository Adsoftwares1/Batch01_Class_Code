import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/models/PublicApiModel.dart';
import 'package:practice_app_class/models/typicode_model.dart';

class TypicodeAPI extends StatefulWidget {
  const TypicodeAPI({super.key});
  @override
  State<TypicodeAPI> createState() => _TypicodeAPIState();
}

class _TypicodeAPIState extends State<TypicodeAPI> {
  // List<PublicApiModel> myList = [];
  //List<String> myList = [];

  List<TypiCodeModel> myList = [];

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
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text("${myList[index].name}"),
              subtitle: Row(
                children: [
                  Text("${myList[index].address!.street}"),
                  Text("${myList[index].address!.geo!.lat}"),
                ],
              ),

              //leading: Text("Hello"),
            );
          }),
    );
  }

  Future<void> getDataFromApi() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        List<dynamic> decodedData = json.decode(response.body);
        for (var data in decodedData) {
          //myList.add(data['address']['geo']['lat']);
          myList.add(TypiCodeModel.fromJson(data));
        }
        print("My List Length: ${myList.length}");
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print("Error in Api: $e");
    }
  }
}
