import 'package:flutter/material.dart';
import 'package:zetaton/app/modules/register/view/widgets/register_card.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          const RegisterCard()
        ],
      ),
    );
  }
}
