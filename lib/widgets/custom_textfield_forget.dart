import 'package:flutter/material.dart';

class CustomTextFormFieldForget extends StatelessWidget {
  final String labelText;
  final bool isPasswordField;
  final bool obscureText;
  final IconButton? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFieldForget({
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          suffixIcon: suffixIcon,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
