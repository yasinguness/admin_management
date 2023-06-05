// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: implement onNavigation

    /* if (!.authenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(LoginRoute());
    } */
  }
}
