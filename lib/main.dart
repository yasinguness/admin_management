import 'package:admin_management/provider_setup.dart';
import 'package:admin_management/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(title: 'Material App', home: HomeScreen()),
    );
  }
}
