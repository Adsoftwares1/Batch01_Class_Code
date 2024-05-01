import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app_class/firebase_options.dart';
import 'package:practice_app_class/task_15_4_24/login_post_api.dart';
import 'package:practice_app_class/task_15_4_24/login_with_api.dart';
import 'package:practice_app_class/task_16_4_24/put_api.dart';
import 'package:practice_app_class/task_17_4_2024/delete_api.dart';
import 'package:practice_app_class/task_24_4.dart/Update_Api.dart';
import 'package:practice_app_class/task_24_4.dart/post_api_hit.dart';
import 'package:practice_app_class/task_25_4/Delete_API_delete.dart';
import 'package:practice_app_class/task_27/inserting_image.dart';
import 'package:practice_app_class/task_28/api_integration.dart';
import 'package:practice_app_class/task_28/practice.dart';
import 'package:practice_app_class/task_29_4_24/Crud_Operations.dart';
import 'package:practice_app_class/task_29_4_24/sign_in_with_email_password.dart';
import 'package:practice_app_class/task_3_4_24/public_api.dart';
import 'package:practice_app_class/task_4_1/api_with_map.dart';
import 'package:practice_app_class/task_4_4_2024/typicode_api.dart';
import 'package:practice_app_class/task_4_4_2024/user_api.dart';
import 'package:practice_app_class/task_5_1_24/chatGptApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //WidgetsBinding.instance.Ensureintialized();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print("My token is : ${pref.getString('mytoken')}");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatGPTAPI(),
    );
  }
}
