// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/base/base_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SideMenuViewModel extends BaseModel {
  UserService? userService;
  SideMenuViewModel({
    this.userService,
  });

  logout(BuildContext context) {
    setBusy(true);
    context.router.removeUntil((route) => false);

    context.router.push(LoginRoute());
    userService!.logout(context);
    setBusy(false);
  }
}
