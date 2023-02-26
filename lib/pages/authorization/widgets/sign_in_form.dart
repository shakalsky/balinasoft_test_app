import 'package:balinasoft_test_app/pages/authorization/widgets/button.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/input_field.dart';
import 'package:balinasoft_test_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

typedef LoginFunction = Function(String, String);

class SignInForm extends StatefulWidget {
  final LoginFunction onLoginTap;

  const SignInForm({
    super.key,
    required this.onLoginTap,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextInput(
            controller: _loginController,
            hintText: 'Login',
          ),
          const SizedBox(height: 8.0),
          AppTextInput(
            controller: _passwordController,
            hintText: 'Password',
            hideInputText: true,
          ),
          const SizedBox(height: 24.0),
          AppButton(
            name: 'LOG IN',
            onTap: () => widget.onLoginTap(_loginController.text, _passwordController.text),
          )
        ],
      ),
    );
    ;
  }
}
