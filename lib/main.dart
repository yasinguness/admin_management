import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/provider_setup.dart';
import 'package:admin_management/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        title: 'Admin Management',
        initialRoute: RouteConst.homeScreen,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
