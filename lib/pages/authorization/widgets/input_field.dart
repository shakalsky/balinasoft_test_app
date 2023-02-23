import 'package:flutter/material.dart';

class AppTextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hideInputText;

  const AppTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.hideInputText = false,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        // border: InputBorder.none,
        hintText: widget.hintText,
      ),
      obscureText: widget.hideInputText,
      enableSuggestions: !widget.hideInputText,
      autocorrect: !widget.hideInputText,
    );
  }
}
