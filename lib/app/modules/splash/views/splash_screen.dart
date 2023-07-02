import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/splash/provider/splash_provider.dart';
import 'package:zetaton/app/resources/app_color.dart';
import 'package:zetaton/app/resources/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await Provider.of<SplashProvider>(context, listen: false)
          .checkIfLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.logo,
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProgressIndicator(
                color: AppColor.accentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
