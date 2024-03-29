import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/ui/dashboard/view_model/dashboard_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton<OrderService>(OrderService());
  locator.registerSingleton<ProductService>(ProductService());
  locator.registerSingleton<UserService>(UserService());
  locator.registerLazySingleton(() => DashboardViewModel());
  /* locator.registerSingleton<ProductServices>(ProductServices());
  locator.registerSingleton<OrderService>(OrderService());
  locator.registerSingleton<CustomerService>(CustomerService()); */
}
