import 'package:flutter/material.dart';
import 'package:zetaton/app/resources/app_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.height,
      this.color});
  final IconData icon;
  final Function onTap;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(
          icon,
          color: color ?? AppColor.accentColor,
        ),
        iconSize: height ?? 20,
        onPressed: () {
          onTap();
        },
      ),
    );
  }
}
