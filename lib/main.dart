import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app_class/Routing_27_5_2024/route_configuration.dart';
import 'package:practice_app_class/firebase_options.dart';

void main() async {
  //WidgetsBinding.instance.Ensureintialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final myAppRouter = MyApproutes();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print("My token is : ${pref.getString('mytoken')}");
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'H-Tracker',
      //routerConfig: myAppRouter.router,
      routeInformationProvider: myAppRouter.goRouter.routeInformationProvider,
      routeInformationParser: myAppRouter.goRouter.routeInformationParser,
      routerDelegate: myAppRouter.goRouter.routerDelegate,
    );
  }
}
