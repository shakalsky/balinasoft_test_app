import 'package:balinasoft_test_app/data/database_data_source.dart';
import 'package:balinasoft_test_app/pages/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseDataSource.initializeHive();
  runApp(const MyApp());
}
