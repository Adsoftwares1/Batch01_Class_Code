import 'dart:convert';

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
          path: '/profile/:userName',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: ProfileScreem(
              userName: state.pathParameters['userName']!,
            ));
          },
        ),
        GoRoute(
          name: MyAppRoutesConstants.settings,
          path: '/settings/:map',
          pageBuilder: (context, state) {
            Map<String, dynamic> myPassedMap =
                jsonDecode(state.pathParameters['map']!);
            return MaterialPage(
                child: SettingScreen(
              myMap: myPassedMap,
            ));
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
