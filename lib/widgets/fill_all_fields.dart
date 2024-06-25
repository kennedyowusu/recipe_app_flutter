import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController fillAllFields() {
  return Get.snackbar(
    'Error',
    'Please fill in all fields',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
