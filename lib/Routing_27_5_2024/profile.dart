import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_constants.dart';
import 'package:practice_app_class/Routing_27_5_2024/setting.dart';

class ProfileScreem extends StatefulWidget {
  const ProfileScreem({super.key});

  @override
  State<ProfileScreem> createState() => _ProfileScreemState();
}

class _ProfileScreemState extends State<ProfileScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  GoRouter.of(context).goNamed(MyAppRoutesConstants.settings);
                },
                child: Text("Setting Screem")),
          ],
        ),
      ),
    );
  }
}
