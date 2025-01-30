import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      title: 'Email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = false;

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      keyboardType: TextInputType.visiblePassword,
      title: 'Password',
      obscureText: _isObscure,
      suffixIcon: IconButton(
        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        onPressed: _toggleObscureText,
      ),
    );
  }
}
