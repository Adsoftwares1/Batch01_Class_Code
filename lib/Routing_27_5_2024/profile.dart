import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_constants.dart';
import 'package:practice_app_class/Routing_27_5_2024/setting.dart';

class ProfileScreem extends StatefulWidget {
  ProfileScreem({super.key, required this.userName});

  String userName;

  @override
  State<ProfileScreem> createState() => _ProfileScreemState();
}

class _ProfileScreemState extends State<ProfileScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Profile Screen"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Map<String, dynamic> myDataToPass = {
                    "name": "Faizan",
                    "age": "40",
                    "contact": "000000",
                  };

                  String convertingMaptoSting = jsonEncode(myDataToPass);
                  GoRouter.of(context)
                      .goNamed(MyAppRoutesConstants.settings, pathParameters: {
                    "map": convertingMaptoSting,
                  });
                },
                child: Text("Setting Screem")),
          ],
        ),
      ),
    );
  }
}
