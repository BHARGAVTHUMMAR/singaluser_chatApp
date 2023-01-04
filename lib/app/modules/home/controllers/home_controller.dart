import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singal_chat_app/Models/userModels.dart';
import 'package:singal_chat_app/constants/api_constants.dart';
import 'package:singal_chat_app/constants/sizeConstant.dart';
import 'package:singal_chat_app/main.dart';
import 'package:singal_chat_app/service/Firebase_service.dart';

class HomeController extends GetxController {
  UserModels? userData;
  RxString username = "".obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      userData = await FirebaseService().getUserData(
          uid: box.read(ArgumentConstant.userUid), context: Get.context!);
      if (!isNullEmptyOrFalse(userData)) {
        username.value = userData!.Name.toString();
      }
    });
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
