import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/modules/register/provider/register_provider.dart';
import 'package:zetaton/app/modules/register/view/widgets/credentials_widget.dart';
import 'package:zetaton/app/modules/register/view/widgets/personal_details_widget.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, _) {
      return Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: provider.index == 0
                  ? const PersonalDetailsWidget()
                  : const CredentialsWidget()));
    });
  }
}
