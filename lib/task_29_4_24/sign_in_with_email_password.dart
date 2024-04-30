import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'package:practice_app_class/task_29_4_24/home_screen.dart';
import 'package:practice_app_class/task_29_4_24/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // i have added init state in delete API folder
    super.initState();
  }

  late SharedPreferences pref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "john@gmail.com",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "New password",
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: "Confirm new password",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Missing Email")));
                } else if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  siginUpWithEmailandPassword(
                      _emailController.text, _passwordController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Passwords not matched")));
                }
                //deleteApi();
              },
              child: Text("Login"),
            ),
            IconButton(
                onPressed: () async {
                  await _signInWithGoogle();
                },
                icon: Icon(
                  Icons.login,
                  size: 100,
                )),
          ],
        ),
      ),
    );
  }

  void siginUpWithEmailandPassword(
      String emailPassed, String passwordPassed) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailPassed, password: passwordPassed);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Account Created Sucess")));
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed $e")));
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> _signInWithGoogle() async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in process
        return null;
      }

      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Return the signed-in user
      return userCredential.user;
    } catch (error) {
      print('Error signing in with Google: $error');
      return null;
    }
  }

//   Future<User?> _signUpWithGoogle() async {
//   try {
//     // Perform Google Sign-In as shown in the previous example
//     User? user = await _signInWithGoogle();

//     // Check if the user is new
//     if (user != null && user.additionalUserInfo!.isNewUser) {
//       // Perform additional registration steps if needed
//       // For example, navigate to a registration screen to collect additional user information
//     }

//     // Return the signed-up user
//     return user;
//   } catch (error) {
//     print('Error signing up with Google: $error');
//     return null;
//   }
// }
}
