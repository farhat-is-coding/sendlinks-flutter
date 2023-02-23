import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final _firestore = FirebaseFirestore.instance;

class Test extends StatefulWidget {
  static const String id = 'test';
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {



  void addMessage() async {
    final ref = FirebaseFirestore.instance.doc("users/farhat");
    await ref.set({
      "name": "farhat",
      "age": 20,
      "address": {
        "line1": "100 Mountain View"
      }
    });
  }
  void updateMessage() async {
    final ref = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await ref.doc('farhat').get();
    Map<String, dynamic>? data = docSnapshot.data();
    log(docSnapshot.data().toString());

    data!["address"]["line2"] ="street 69";
    data!["address"]["line1"] ="street 169";
    log(docSnapshot.data()!["address"].toString());
    log(data.toString());
    FirebaseFirestore.instance.collection('users')
        .doc('farhat') // <-- Doc ID where data should be updated.
        .update(data);
  }
  void getMessage() async {

    final ref = FirebaseFirestore.instance.collection('users');
    final snapshot = await ref.get();
    for (var snaps in snapshot.docs) {
      log(snaps.data().toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    //addMessage();
    //getMessage();
    updateMessage();
    return Scaffold(
      body: Column(

      ),
    );
  }
}
