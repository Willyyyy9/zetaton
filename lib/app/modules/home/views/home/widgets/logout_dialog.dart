import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/home/provider/home_provider.dart';
import 'package:zetaton/app/resources/app_color.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
                onPressed: () {
                  provider.logout();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: AppColor.accentColor),
                ))
          ],
        );
      },
    );
  }
}
