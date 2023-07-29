import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ITHomeController homeController = Get.find<ITHomeController>();

class ITHomeController extends GetxController {
  RxBool isHomeLoading = false.obs;

  updateLoadingStatusHomeMainPage() async {
    isHomeLoading.value = true;
    update();
  }

  resetLoadingStatusHomeMainPage() async {
    isHomeLoading.value = false;
    update();
  }
}
