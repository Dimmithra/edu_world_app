import 'package:edu_world_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommonTextFeild extends StatelessWidget {
  const CommonTextFeild({
    super.key,
    required this.hinttext,
    required this.label,
    this.suffixicon,
    this.validation = false,
    this.controller,
    this.fillColor,
    this.maxLength,
    this.textInputType,
    this.suffixIcon,
    this.onChanged,
    this.labelColor,
    this.hinttextColor,
    this.emailValidation = false,
    this.fullborder = false,
    this.filled = false,
    this.isPassword = false,
  });
  final String hinttext;
  final String label;
  final Widget? suffixicon;
  final bool? validation;
  final Color? fillColor;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Color? labelColor;
  final Color? hinttextColor;
  final bool emailValidation;
  final bool fullborder;
  final bool? filled;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return TextFormField(
          maxLength: maxLength,
          keyboardType: textInputType,
          onChanged: onChanged,
          obscureText: isPassword!,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(
              color: hinttextColor,
            ),
            label: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: labelColor,
              ),
            ),
            enabledBorder: fullborder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: homeProvider.darkMode
                            ? Colors.white
                            : Colors.black),
                  )
                : null,
            focusedBorder: !fullborder
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: homeProvider.darkMode
                            ? Colors.white
                            : Colors.black),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: homeProvider.darkMode
                            ? Colors.white
                            : Colors.black),
                  ),
            suffix: suffixicon,
            filled: filled,
            fillColor: fillColor,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            // ),
            suffixIcon: suffixIcon,
          ),
          validator: (value) {
            //email regex
            String emailreg = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*$';
            RegExp regex = new RegExp(emailreg);
            if (validation == true) {
              if (value == null || value.isEmpty) {
                return hinttext + 'Required';
              } else if (emailValidation == true) {
                if (!regex.hasMatch(value)) {
                  return 'Please enter valid Email Address';
                }
              }
              return null;
            }
          },
          controller: controller,
        );
      },
    );
  }
}
