import 'package:balinasoft_test_app/data/hive/database_data_source.dart';
import 'package:balinasoft_test_app/pages/authorization/authorization_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseDataSource.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balinasoft test app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AuthorizationPage(),
    );
  }
}
