import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool isPasswordField;
  final bool obscureText;
  final IconButton? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.isPasswordField = false,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          suffixIcon: suffixIcon,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
