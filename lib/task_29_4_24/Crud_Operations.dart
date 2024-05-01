import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CrudOperations extends StatefulWidget {
  const CrudOperations({super.key});

  @override
  State<CrudOperations> createState() => _CrudOperationsState();
}

class _CrudOperationsState extends State<CrudOperations> {
  var nameController = TextEditingController();
  var fatherName = TextEditingController();
  var Address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "User Name",
                ),
              ),
            ),
            Container(
              width: 120,
              child: TextField(
                controller: fatherName,
                decoration: InputDecoration(
                  hintText: "Father Name",
                ),
              ),
            ),
            Container(
              width: 120,
              child: TextField(
                controller: Address,
                decoration: InputDecoration(
                  hintText: "Address",
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await insertDataInFirestore();
              },
              child: Text("Submit Data"),
            ),
            TextButton(
              onPressed: () async {
                await updatedatainfirestore();
              },
              child: Text("Update Data"),
            ),
            TextButton(
              onPressed: () async {
                await deletedatafirebasestore();
              },
              child: Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> insertDataInFirestore() async {
    try {
      FirebaseFirestore obj = await FirebaseFirestore.instance;

      var myCollection = obj.collection("users");

      myCollection.add({
        "name": "Mujeeb Ur rehman",
        "father_name": "Rehman Ullah",
        "Age": 90,
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updatedatainfirestore() async {
    try {
      var objj = await FirebaseFirestore.instance;
      var mycolection = objj.collection('users');
      mycolection
          .doc('kidb3JcneHLwMqh69uTM')
          .update({"father_name": 'muhammad'});
    } catch (e) {
      print('$e');
    }
  }

  Future<void> getdataFirebasestore() async {
    try {
      var objj = await FirebaseFirestore.instance;
      var mycolection = objj.collection('users');

      var data = await mycolection.doc('kidb3JcneHLwMqh69uTM').get();
      if (data.exists) {
        print('Document data: ${data.data()}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('$e');
    }
  }
}

deletedatafirebasestore() async {
  try {
    var objj = await FirebaseFirestore.instance;
    var mycolection = objj.collection('users');
    mycolection.doc('kidb3JcneHLwMqh69uTM').delete();
  } catch (e) {
    print('$e');
  }
}
