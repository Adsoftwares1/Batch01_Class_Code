import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/models/country_list.dart';

class APIWithMap extends StatefulWidget {
  const APIWithMap({super.key});

  @override
  State<APIWithMap> createState() => _APIWithMapState();
}

class _APIWithMapState extends State<APIWithMap> {
  // List<String> coutryNames = [];

  //List<Map<String, dynamic>> myCountryData = [];
  // List to store the parsed data

  List<CountryListModel> myCountries = [];
  List<String> commonNames = [];
  List<String> imageUrl = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getDataFromApi();
      setState(() {});
      //await fetchCommonNames();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: commonNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.network(
                  imageUrl[index],
                  semanticsLabel: 'A shark?!',
                  placeholderBuilder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            title: Text("${commonNames[index]}"),
          );
        },
      ),
    );
  }

  Future<void> getDataFromApi() async {
    final URL =
        Uri.parse("https://countriesnow.space/api/v0.1/countries/flag/images");
    print("Message1");
    try {
      final response = await http.get(URL);
      print("Message2");
      if (response.statusCode == 200) {
        print("Message3");
        final List<dynamic> data = json.decode(response.body)['data'];
        print("Message4");
        //print("My Data: $data");
        for (var jsonData in data) {
          //myCountries.add(CountryListModel.fromJson(jsonData));
          imageUrl.add(jsonData['flag']);
          commonNames.add(jsonData['name']);
        }
        //print("Message5 : ${myCountryData.length}");
      } else {
        print("Message6");
        print("API ISSUE : ${response.statusCode}");
      }
    } catch (e) {
      print("Message7");
      print("Error: $e");
    }
  }
}
