import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  final String title;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: title,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
