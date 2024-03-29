import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/ui/auth/sign_in/view/login.dart';
import 'package:admin_management/ui/dashboard/view/dashboard.dart';
import 'package:admin_management/ui/home/home.dart';
import 'package:admin_management/ui/order_statistic/view/order_statistic_view.dart';
import 'package:admin_management/ui/product/products_list/view/product_list.dart';
import 'package:admin_management/ui/product/products_list/view/update_product.dart';
import 'package:admin_management/ui/product/upload_product/view/upload_product.dart';
import 'package:admin_management/ui/settings/view/settings.dart';
import 'package:admin_management/ui/side_menu/side_menu.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: "Screen,Route",
)
class AppRouter extends _$AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
          path: '/login',
        ),
        AutoRoute(page: HomeRoute.page, path: "/home", children: [
          AutoRoute(
            page: DashboardRoute.page,
            path: "dashboard",
            initial: true,
          ),
          CustomRoute(
              transitionsBuilder: TransitionsBuilders.fadeIn,
              page: ProductsRoute.page,
              path: "productList",
              children: [AutoRoute(page: UpdateProductRoute.page)]),
          CustomRoute(
              transitionsBuilder: TransitionsBuilders.fadeIn, page: UploadProductRoute.page, path: "uploadProduct"),
          CustomRoute(
              transitionsBuilder: TransitionsBuilders.fadeIn, page: OrderStatisticRoute.page, path: "statistics"),
          CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn, page: SettingsRoute.page, path: "settings"),
        ]),
      ];
}
