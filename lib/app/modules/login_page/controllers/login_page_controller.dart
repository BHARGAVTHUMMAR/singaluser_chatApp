import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singal_chat_app/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  Rx<TextEditingController> EmailController = TextEditingController().obs;
  Rx<TextEditingController> PassController = TextEditingController().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
