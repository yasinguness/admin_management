import 'package:admin_management/common/provider/auth_provider.dart';
import 'package:admin_management/common/provider/order_provider.dart';
import 'package:admin_management/common/provider/product_provider.dart';
import 'package:admin_management/common/themes/theme.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp.router(
        theme: themeData,
        routerConfig: _appRouter.config(/* reevaluateListenable: AuthProvider() */),
        title: 'Admin Management',
        /*  initialRoute: RouteConst.loginView,
        onGenerateRoute: generateRoute, */
      ),
    );
  }
}
