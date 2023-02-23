import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sendlinks/services/models.dart';

import 'auth.dart';
import 'dart:developer' as d;


class FirestoreService{

  Future<void> addPFP(String img) async {
    final ref = FirebaseFirestore.instance.doc("users/${AuthService().user?.uid}");
    var data = {
      "pfp_url": img,
    };

    return ref.set(data, SetOptions(merge: true));
  }
  Future<void> addName(String name) async {
    final ref = FirebaseFirestore.instance.doc("users/${AuthService().user?.uid}");
    var data = {
      "name": name,
    };
    return ref.set(data, SetOptions(merge: true));
  }

  Future<void> addSocial(String socialmedia, String username) async{
    final ref = FirebaseFirestore.instance.collection('users').doc(AuthService().user?.uid);

    var data = {
      'socials': {
        socialmedia: username
      }
    };
    return ref.set(data, SetOptions(merge: true));
  }

  Stream<User> getCurrentUser()  {
    var ref = FirebaseFirestore.instance.collection('users').doc(AuthService().user?.uid); // users/smthng
    return ref.snapshots().map((doc) => User.fromJson(doc.data()!));
  }

  Future<List<User>>? getUsers()  async {
    var ref = FirebaseFirestore.instance.collection('users'); // users/smthng
    var snapshot = await ref.get(); // get gets a document only once (not realtime)
    var data = snapshot.docs.map((s) => s.data()); // foreach loop is used
    var users = data.map((d) => User.fromJson(d));
    //log(topics.toString());
    return users.toList();
  }
}