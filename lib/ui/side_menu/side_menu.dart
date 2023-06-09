import 'package:admin_management/common/widgets/drawer_list_tile.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/side_menu/view_model/side_menu_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SideMenuScreen extends StatefulWidget {
  //final void Function(int index) press;
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  var model = SideMenuViewModel(userService: locator<UserService>());
  @override
  Widget build(BuildContext context) {
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
              context.router.push(const DashboardRoute());
            },
          ),
          DrawerListTile(
            title: "Ürün Listesi",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              context.router.push(const ProductsRoute());
            },
          ),
          DrawerListTile(
            title: "Ürün Ekle",
            svgSrc: "assets/icons/product.svg",
            press: () {
              context.router.push(const UploadProductRoute());
            },
          ),
          DrawerListTile(
            title: "İstatistikler",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.router.push(const OrderStatisticRoute());
            },
          ),
          DrawerListTile(
            title: "Ayarlar",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              context.router.push(const SettingsRoute());
            },
          ),
          DrawerListTile(
            title: "Çıkış Yap",
            svgSrc: "assets/icons/logout.svg",
            press: () {
              model.logout(context);
            },
          )
        ],
      ),
    );
  }
}
