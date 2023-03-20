import 'package:admin_management/common/constants/responsive.dart';
import 'package:admin_management/ui/dashboard_screen/dashboard.dart';
import 'package:admin_management/ui/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              flex: 1,
              child: SideMenu(),
            ),
          const Expanded(flex: 9, child: DashboardScreen()),
        ],
      )),
    );
  }
}
