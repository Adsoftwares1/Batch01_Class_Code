import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PracticeApp extends StatefulWidget {
  const PracticeApp({super.key});

  @override
  State<PracticeApp> createState() => _PracticeAppState();
}

class _PracticeAppState extends State<PracticeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              fetchDataAndPrint();
            },
            child: Text("Hit API")),
      ),
    );
  }

  Future<void> fetchDataAndPrint() async {
    final url =
        Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];

        // Print the data
        for (var jsonData in data) {
          print('Name: ${jsonData['name']}');
          print('Flag URL: ${jsonData['flag']}');
          print('ISO2: ${jsonData['iso2']}');
          print('ISO3: ${jsonData['iso3']}');
          print('');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
