import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:singal_chat_app/Models/userModels.dart';
import 'package:singal_chat_app/constants/api_constants.dart';
import 'package:singal_chat_app/constants/sizeConstant.dart';
import 'package:singal_chat_app/main.dart';

class FirebaseService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  Future<void> addUserData({required UserModels userModels}) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userModels.uid)
        .set(userModels.toMap());
  }

  Future<User?> SingUpUser(
      {required BuildContext context, required UserModels userModels}) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userModels.Email.toString(),
              password: userModels.Password.toString());
      user = userCredential.user;
      if (!isNullEmptyOrFalse(user)) {
        if (!isNullEmptyOrFalse(user!.uid)) {
          userModels.uid = user.uid;
          box.write(ArgumentConstant.userUid, user.uid);
          await addUserData(userModels: userModels);
        }
      }
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }
    return user;
  }

  Future<User?> loginUser(
      {required BuildContext context, required UserModels userModels}) async {
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userModels.Email.toString(),
              password: userModels.Password.toString());
      user = userCredential.user;
      if (!isNullEmptyOrFalse(user)) {
        if (!isNullEmptyOrFalse(user!.uid)) {
          userModels.uid = user.uid;
          box.write(ArgumentConstant.userUid, user.uid);
        }
      }
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }
    return user;
  }

  Future<UserModels?> getUserData(
      {required String uid, required BuildContext context}) async {
    var data = await firebaseFireStore.collection("users").doc(uid).get();
    return UserModels.fromMap(data.data()!);
  }
}
