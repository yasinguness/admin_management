import 'package:admin_management/common/constants/responsive.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/home/view_model/home_view_model.dart';
import 'package:admin_management/ui/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(),
      builder: (context, value, widget) => Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(
                  press: (index) => value.selectedIndex(index),
                ),
              ),
            Expanded(flex: 9, child: value.screens[value.currentIndex]),
          ],
        )),
      ),
    );
  }
}
