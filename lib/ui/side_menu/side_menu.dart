import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/common/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final void Function(int index) press;
  const SideMenu({super.key, required this.press});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    int index = 0;
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
            title: "Siparişler",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              index = 0;
              widget.press(index);
            },
          ),
          DrawerListTile(
            title: "Ürün Listesi",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              index = 1;
              widget.press(index);
            },
          ),
          DrawerListTile(
            title: "Ürün Ekle",
            svgSrc: "assets/icons/product.svg",
            press: () {
              index = 2;
              widget.press(index);
            },
          ),
          /*  DrawerListTile(
            title: "Yardım Ve Destek",
            svgSrc: "assets/icons/support.svg",
            press: () {
              
            },
          ) */
          DrawerListTile(
            title: "Ayarlar",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              index = 3;
              widget.press(index);
            },
          ),
          DrawerListTile(
            title: "Çıkış Yap",
            svgSrc: "assets/icons/logout.svg",
            press: () {
              Navigator.pushNamedAndRemoveUntil(context, RouteConst.loginView, (route) => false);
            },
          )
        ],
      ),
    );
  }
}
