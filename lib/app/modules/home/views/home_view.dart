import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text("${controller.username.value}"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
