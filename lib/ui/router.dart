import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/ui/auth/sign_in/view/login.dart';
import 'package:admin_management/ui/dashboard/view/dashboard.dart';
import 'package:admin_management/ui/home/home.dart';
import 'package:admin_management/ui/product/products_list/view/product_list.dart';
import 'package:admin_management/ui/product/upload_product/view/upload_product.dart';
import 'package:admin_management/ui/settings/view/settings.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConst.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case RouteConst.loginView:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );

    case RouteConst.dashboardScreen:
      return MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      );

    case RouteConst.profileScreen:
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );

    //Products
    case RouteConst.productLists:
      return MaterialPageRoute(
        builder: (context) => const ProductsScreen(),
      );

    case RouteConst.uploadProduct:
      return MaterialPageRoute(
        builder: (context) => const UploadProductScreen(),
      );

    default:
  }
  return null;
}
