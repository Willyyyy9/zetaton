import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zetaton/app/resources/app_color.dart';

class Constants {
  static const String userCollection = "Users";
  static const String favouriteCollection = "Favourite";

  static const String token =
      "TKKs0JJJ95Pc1BnjgcyekRJDPUg12DCY7qLoyE54ORiNNSlcpAQwZ2oZ";
  static const String isLoggedIn = "isLoggedIn";

  static void configureLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..successWidget = const Icon(
        FontAwesomeIcons.circleCheck,
        color: Colors.green,
        size: 45,
      )
      ..errorWidget = const Icon(
        FontAwesomeIcons.circleExclamation,
        color: Colors.red,
        size: 45,
      )
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..progressWidth = 5
      ..backgroundColor = AppColor.primaryColor.withOpacity(0.8)
      ..indicatorColor = AppColor.lightColor
      ..textColor = Colors.white
      ..maskColor = AppColor.primaryColor.withOpacity(0.5)
      ..userInteractions = true
      ..fontSize = 18
      ..textPadding = const EdgeInsets.symmetric(vertical: 25)
      ..textStyle = const TextStyle(
          fontFamily: 'Symbio',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800)
      ..dismissOnTap = false;
  }
}
