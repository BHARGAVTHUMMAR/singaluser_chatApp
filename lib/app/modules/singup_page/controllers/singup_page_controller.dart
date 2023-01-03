import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singal_chat_app/Models/userModels.dart';

class SingupPageController extends GetxController {
  Rx<TextEditingController> NameController = TextEditingController().obs;
  Rx<TextEditingController> EmailController = TextEditingController().obs;
  Rx<TextEditingController> PassController = TextEditingController().obs;
  Rx<TextEditingController> ConformPassController = TextEditingController().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void SingUp({required String Email, required String Password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password)
          .then((value) => addUserData(value));
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
    }
  }

  addUserData(UserCredential user) {
    String uid = user.user!.uid;
    UserModels userModels = UserModels(
      Name: NameController.value.text.trim(),
      Email: EmailController.value.text.trim(),
      uid: uid,
      Password: PassController.value.text.trim(),
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userModels.toMap());
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
