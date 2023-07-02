import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/modules/register/model/user_model.dart';
import 'package:zetaton/app/modules/register/network/register_server.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class RegisterProvider with ChangeNotifier {
  GlobalKey<FormState> registerPersonalDetailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerCredentialsFormKey = GlobalKey<FormState>();
  TextEditingController registerFirstNameController = TextEditingController();
  TextEditingController registerLastNameController = TextEditingController();
  TextEditingController registerPhoneNumberController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

  int index = 0;

  changeIndex(int pageIndex) {
    index = pageIndex;
    notifyListeners();
  }

  Future register() async {
    try {
      if (registerCredentialsFormKey.currentState!.validate()) {
        EasyLoading.show(status: "Loading");
        UserCredential registerCredential = await RegisterServer().register(
            email: registerEmailController.text,
            password: registerPasswordController.text);
        UserModel userModel = UserModel(
            id: registerCredential.user!.uid,
            firstName: registerFirstNameController.text,
            lastName: registerLastNameController.text,
            email: registerEmailController.text,
            phoneNumber: registerPhoneNumberController.text);
        await RegisterServer().saveUser(userModel: userModel);
        EasyLoading.dismiss();
        EasyLoading.showSuccess("User Created");
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool(Constants.isLoggedIn, true);
        Get.toNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.dismiss();
        EasyLoading.showError("Weak Password");
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.dismiss();
        EasyLoading.showError("Email Already Exists");
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError("Interal Error. Try Again");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Check Internet Connectivity");
    }
    notifyListeners();
  }
}
