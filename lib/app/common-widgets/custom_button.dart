import 'package:flutter/material.dart';
import 'package:zetaton/app/resources/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          backgroundColor: MaterialStateProperty.all(AppColor.accentColor)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: AppColor.lightColor),
      ),
    );
  }
}
