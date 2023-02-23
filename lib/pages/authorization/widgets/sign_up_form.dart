import 'package:balinasoft_test_app/pages/authorization/widgets/button.dart';
import 'package:balinasoft_test_app/pages/authorization/widgets/input_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatedController = TextEditingController();

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
          const SizedBox(height: 8.0),
          AppTextInput(
            controller: _passwordRepeatedController,
            hintText: 'Repeat password',
            hideInputText: true,
          ),
          const SizedBox(height: 24.0),
          AppButton(
            name: 'SIGN UP',
            onTap: () => print('tap'),
          )
        ],
      ),
    );
  }
}
