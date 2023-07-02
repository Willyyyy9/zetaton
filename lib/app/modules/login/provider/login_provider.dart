import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/modules/login/network/login_server.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class LoginProvider with ChangeNotifier {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  Future login() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        EasyLoading.show(status: "Loading");
        await LoginServer().login(
            email: loginEmailController.text,
            password: loginPasswordController.text);
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Logged In");
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(Constants.isLoggedIn, true);
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.dismiss();

        EasyLoading.showError("Email Not Found");
      } else if (e.code == 'wrong-password') {
        EasyLoading.dismiss();
        EasyLoading.showError("Wrong Password");
      }
    } catch (e) {
      EasyLoading.dismiss();

      EasyLoading.showError("Check Internet Connectivity");
    }
    notifyListeners();
  }
}
