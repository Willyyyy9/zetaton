import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zetaton/app/resources/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool? isPasswordField;
  final IconData? prefixIcon;
  final Function(String)? onSubmited;
  final String? Function(String?)? validator;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.validator,
      this.onSubmited,
      this.prefixIcon,
      this.isPasswordField,
      this.keyboardType,
      this.inputFormatters,
      this.height});
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          onFieldSubmitted: widget.onSubmited,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a value";
                } else {
                  return null;
                }
              },
          inputFormatters: widget.inputFormatters,
          obscureText: widget.isPasswordField == true ? isObscureText : false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon!,
                      color: AppColor.accentColor,
                    )
                  : null,
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIconConstraints: const BoxConstraints(maxHeight: 16),
              suffixIcon: widget.isPasswordField == true
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isObscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                    )
                  : null),
        ),
      ),
    );
  }
}
