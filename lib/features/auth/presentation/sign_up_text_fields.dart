import 'package:flutter/material.dart';
import 'package:zoom_flutter/common/widgets/widgets.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      title: 'Email',
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.isObscure = false,
    this.onToggleObscureText,
  });

  final bool isObscure;
  final VoidCallback? onToggleObscureText;

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      title: 'Password',
      obscureText: isObscure,
      suffixIcon: IconButton(
        isSelected: isObscure,
        selectedIcon: Icon(Icons.visibility_off),
        icon: Icon(Icons.visibility),
        onPressed: onToggleObscureText,
      ),
    );
  }
}
