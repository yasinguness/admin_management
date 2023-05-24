import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/common/provider/order_provider.dart';
import 'package:admin_management/common/provider/product_provider.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/ui/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        )
      ],
      child: const MaterialApp(
        title: 'Admin Management',
        initialRoute: RouteConst.homeScreen,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
