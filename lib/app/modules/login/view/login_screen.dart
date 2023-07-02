import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zetaton/app/common-widgets/custom_icon_button.dart';
import 'package:zetaton/app/modules/login/view/widgets/login_card.dart';
import 'package:zetaton/app/modules/login/view/widgets/register_widget.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';
import 'package:zetaton/app/routes/app_pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          ImageAssets.logo,
          height: 50,
          fit: BoxFit.contain,
        ),
        backgroundColor: AppColor.appBarColor,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(118, 47, 207, 0.2),
                    Color.fromRGBO(
                        9, 9, 14, 0.2), // Starting color with low opacity
                    Color.fromRGBO(
                        118, 47, 207, 0.2), // Ending color with full opacity
                  ],
                  stops: [
                    0.1,
                    0.7,
                    1
                  ]),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [LoginCard(), RegisterWidget()],
            ),
          ),
        ],
      ),
    );
  }
}
