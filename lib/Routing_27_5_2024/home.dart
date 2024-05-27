import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_app_class/Routing_27_5_2024/profile.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_constants.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Home Screen"),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(MyAppRoutesConstants.profile);
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => ProfileScreem()));
                },
                child: Text("Profile Screen")),
          ],
        ),
      ),
    );
  }
}
