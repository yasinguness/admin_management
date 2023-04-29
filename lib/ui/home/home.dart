import 'package:admin_management/common/constants/responsive.dart';
import 'package:admin_management/ui/product/product_list.dart';
import 'package:admin_management/ui/product/upload_product.dart';
import 'package:admin_management/ui/profile/view/profile_view.dart';
import 'package:admin_management/ui/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screens = [
      const ProductsScreen(),
      const UploadProductScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              flex: 1,
              child: SideMenu(),
            ),
          const Expanded(flex: 9, child: ProductsScreen()),
        ],
      )),
    );
  }
}
