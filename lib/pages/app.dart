import 'package:balinasoft_test_app/pages/authorization/authorization_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balinasoft test app',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const AuthorizationPage(),
    );
  }
}
