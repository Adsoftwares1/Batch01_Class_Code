import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class ApiIntegratio extends StatefulWidget {
  const ApiIntegratio({super.key});

  @override
  State<ApiIntegratio> createState() => _ApiIntegratioState();
}

class _ApiIntegratioState extends State<ApiIntegratio> {
  List<String> coutryNames = [];
  // List to store the parsed data
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getDataFromApi();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: coutryNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${dataList[index]['name']}"),
            subtitle: Text("${dataList[index]['is03']}"),
          );
        },
      ),
    );
  }

  Future<void> getDataFromApi() async {
    final URL =
        Uri.parse("https://countriesnow.space/api/v0.1/countries/flag/images");

    try {
      final response = await http.get(URL);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        //print("My Data: $data");
        for (var jsonData in data) {
          coutryNames.add(jsonData['name']);
          Map<String, dynamic> parsedData = {
            'name': jsonData['name'],
            'flag_url': jsonData['flag'],
            'is02': jsonData['iso2'],
            'is03': jsonData['iso3'],
          };
          dataList.add(parsedData);
        }
      } else {
        print("API ISSUE : ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
