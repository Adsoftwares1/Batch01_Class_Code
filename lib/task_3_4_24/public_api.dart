import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/models/PublicApiModel.dart';

class PublicApi extends StatefulWidget {
  const PublicApi({super.key});

  @override
  State<PublicApi> createState() => _PublicApiState();
}

class _PublicApiState extends State<PublicApi> {
  List<PublicApiModel> myList = [];

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
              title: Text("${myList[index].catagory}"),
              subtitle: Text("${myList[index].api}"),

              //leading: Text("Hello"),
            );
          }),
    );
  }

  Future<void> getDataFromApi() async {
    try {
      final response =
          await http.get(Uri.parse("https://api.publicapis.org/entries"));
      if (response.statusCode == 200) {
        final List<dynamic> myJsonData = json.decode(response.body)['entries'];

        /////////////////////////////
        for (var entry in myJsonData) {
          myList.add(PublicApiModel.fromJson(entry));
        }
        //print("My List Length ${commonNames.length}");
      } else {
        print("Invlid Api");
      }
    } catch (e) {
      print("Error in Api: $e");
    }
  }
}
