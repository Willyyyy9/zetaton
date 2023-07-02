import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zetaton/app/common-widgets/custom_icon_button.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        CustomIconButton(
            icon: FontAwesomeIcons.userPlus,
            onTap: () {
              Get.toNamed(Routes.REGISTER);
            })
      ]),
    );
  }
}
