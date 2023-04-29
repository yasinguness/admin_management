import 'package:admin_management/common/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final currentIndex;
  const SideMenu({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const DrawerHeader(
              child: Center(
            child: Text(
              "Coffe GPT",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
          )),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Transaction",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Product List",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              /* index = 4;
              currentIndex = index; */
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
