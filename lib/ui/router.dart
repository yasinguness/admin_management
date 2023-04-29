import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/ui/auth/sign_in/view/login.dart';
import 'package:admin_management/ui/dashboard_screen/dashboard.dart';
import 'package:admin_management/ui/home/home.dart';
import 'package:admin_management/ui/product/product_list.dart';
import 'package:admin_management/ui/product/upload_product.dart';
import 'package:admin_management/ui/profile/view/profile_view.dart';
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
        builder: (context) => const ProfileScreen(),
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
