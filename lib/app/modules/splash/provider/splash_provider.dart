import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class SplashProvider with ChangeNotifier {
  Future checkIfLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool(Constants.isLoggedIn) ?? false;
    if (isLoggedIn == true) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
