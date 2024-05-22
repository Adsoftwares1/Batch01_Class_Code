import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore_Database extends StatefulWidget {
  const Firestore_Database({super.key});

  @override
  State<Firestore_Database> createState() => _Firestore_DatabaseState();
}

class _Firestore_DatabaseState extends State<Firestore_Database> {
  TextEditingController nameController = TextEditingController();

  String Address = '';
  String father_name = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async {
              await getData();
            },
            child: Text("Get Data"),
          ),
        ],
      ),
    ));
  }

  Future<void> getData() async {
    try {
      FirebaseFirestore obj = await FirebaseFirestore.instance;
      var myCollection = obj.collection('users');
      var data =
          await myCollection.where('father_name', isEqualTo: "Khan Ali").get();
      //print("${data.docs[0].data()}");
      data.docs.forEach((doc) {
        print('Document ID: ${doc.id}');
        print('Data: ${doc.data()}');
      });
    } catch (e) {
      print("Error: $e");
    }
  }
}
