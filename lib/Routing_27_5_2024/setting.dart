import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_app_class/Routing_27_5_2024/home.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_constants.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key, required this.myMap});

  Map<String, dynamic> myMap;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.myMap["name"]}  : ${widget.myMap["age"]}   : ${widget.myMap["contact"]} "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Setting Screen"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(MyAppRoutesConstants.home);
                },
                child: Text("Home Screen")),
          ],
        ),
      ),
    );
  }
}
