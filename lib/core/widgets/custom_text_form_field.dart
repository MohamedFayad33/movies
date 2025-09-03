import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/color_pallete.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
  });
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: ColorPallete.textFormFieldBackGround,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(color: Colors.white, fontSize: 17),
        decoration: InputDecoration(
          icon: Padding(padding: EdgeInsets.only(left: 10), child: prefixIcon),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
