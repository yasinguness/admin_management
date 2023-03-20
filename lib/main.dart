import 'package:admin_management/network/services/api.dart';
import 'package:admin_management/ui/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Api api = Api();
    return const MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
