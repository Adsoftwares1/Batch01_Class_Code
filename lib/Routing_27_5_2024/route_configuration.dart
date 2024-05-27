import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_app_class/Routing_27_5_2024/home.dart';
import 'package:practice_app_class/Routing_27_5_2024/profile.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_constants.dart';
import 'package:practice_app_class/Routing_27_5_2024/setting.dart';

class MyApproutes {
  GoRouter goRouter = GoRouter(
      // initialLocation: HTrackerSharedPreferences.getBool('loggedInKey') == true
      //      '/home'
      //     : '/',

      routes: [
        GoRoute(
          name: MyAppRoutesConstants.home,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: HomeScreem());
          },
        ),
        GoRoute(
          name: MyAppRoutesConstants.profile,
          path: '/profile',
          pageBuilder: (context, state) {
            return MaterialPage(child: ProfileScreem());
          },
        ),
        GoRoute(
          name: MyAppRoutesConstants.settings,
          path: '/settings',
          pageBuilder: (context, state) {
            return MaterialPage(child: SettingScreen());
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text("No Page found"),
          ),
        ));
      });
}
