import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_button.dart';
import 'package:zetaton/app/common-widgets/custom_text_field.dart';
import 'package:zetaton/app/modules/login/provider/login_provider.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, _) {
      return Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Form(
            key: provider.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                CustomTextField(
                    hint: "Email",
                    prefixIcon: FontAwesomeIcons.envelope,
                    controller: provider.loginEmailController),
                const SizedBox(height: 10),
                CustomTextField(
                  hint: "Password",
                  prefixIcon: FontAwesomeIcons.lock,
                  controller: provider.loginPasswordController,
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
                CustomButton(
                    title: "Login",
                    onTap: () {
                      provider.login();
                    })
              ],
            )),
      ));
    });
  }
}
