import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zetaton/app/common-widgets/custom_button.dart';
import 'package:zetaton/app/common-widgets/custom_text_field.dart';
import 'package:zetaton/app/modules/register/provider/register_provider.dart';

class PersonalDetailsWidget extends StatefulWidget {
  const PersonalDetailsWidget({super.key});

  @override
  State<PersonalDetailsWidget> createState() => _PersonalDetailsWidgetState();
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, _) {
      return Form(
        key: provider.registerPersonalDetailsFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(
                  child: Center(
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Text(
                  "1/2",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            ),
            const Spacer(),
            CustomTextField(
              hint: "First Name",
              prefixIcon: FontAwesomeIcons.signature,
              controller: provider.registerFirstNameController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: "Last Name",
              prefixIcon: FontAwesomeIcons.signature,
              controller: provider.registerLastNameController,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hint: "Phone Number",
              prefixIcon: FontAwesomeIcons.mobileScreen,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: provider.registerPhoneNumberController,
              validator: (phoneNumber) {
                if (phoneNumber == null || phoneNumber.length != 10) {
                  return "Please enter a valid US number";
                } else {
                  return null;
                }
              },
            ),
            const Spacer(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    title: "Next",
                    onTap: () {
                      if (provider.registerPersonalDetailsFormKey.currentState!
                          .validate()) {
                        provider.changeIndex(1);
                      }
                    })
              ],
            )
          ],
        ),
      );
    });
  }
}
