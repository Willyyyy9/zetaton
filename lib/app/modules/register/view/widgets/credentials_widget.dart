import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_button.dart';
import 'package:zetaton/app/common-widgets/custom_icon_button.dart';
import 'package:zetaton/app/common-widgets/custom_text_field.dart';
import 'package:zetaton/app/modules/register/provider/register_provider.dart';

class CredentialsWidget extends StatefulWidget {
  const CredentialsWidget({super.key});

  @override
  State<CredentialsWidget> createState() => _CredentialsWidgetState();
}

class _CredentialsWidgetState extends State<CredentialsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, _) {
      return Form(
        key: provider.registerCredentialsFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(
                  child: Center(
                    child: Text(
                      'Credentials',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "2/2",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
            const Spacer(),
            CustomTextField(
                hint: "Email",
                prefixIcon: FontAwesomeIcons.envelope,
                controller: provider.registerEmailController),
            const SizedBox(height: 10),
            CustomTextField(
              hint: "Password",
              prefixIcon: FontAwesomeIcons.lock,
              controller: provider.registerPasswordController,
              isPasswordField: true,
              validator: (password) {
                if (password == null || password.length < 5) {
                  return "Password must be 6 characters or more";
                } else {
                  return null;
                }
              },
            ),
            const Spacer(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                    icon: FontAwesomeIcons.backward,
                    onTap: () {
                      provider.changeIndex(0);
                    }),
                CustomButton(
                    title: "Sign Up",
                    onTap: () {
                      provider.register();
                    })
              ],
            )
          ],
        ),
      );
    });
  }
}
