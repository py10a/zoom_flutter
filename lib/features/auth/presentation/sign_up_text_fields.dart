import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  const EmailTextField({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      title: 'Email',
      controller: controller,
      suffixIcon: suffixIcon,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.suffixIcon,
    this.obscureText = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      title: 'Password',
      controller: widget.controller,
      obscureText: _isObscure,
      suffixIcon: IconButton(
        icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
        onPressed: _toggleObscureText,
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
