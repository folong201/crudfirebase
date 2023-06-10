import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/model/user.model.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> addUser(User user) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final docUser = FirebaseFirestore.instance.collection("users").doc();
  user.id = docUser.id;
  try {
    print("savegarde");
    await docUser.set(user.toJson());
  } catch (e) {
    print(e.toString());
  }
}

Future<void> updateUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc(user.id);
  await docUser.update(user.toJson());
}


Future<void> DeleteUser(String id) async {
  final docUser = FirebaseFirestore.instance.collection("users").doc(id);
  await docUser.delete();
}


Future getAllUser()async{
  final CollectionReference docUser = FirebaseFirestore.instance.collection("users");
  try {
    // await docUser.getD
  } catch (e) {
    
  }
}