import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const AppButton({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
