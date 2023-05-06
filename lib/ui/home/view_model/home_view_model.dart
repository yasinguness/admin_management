import 'package:admin_management/ui/base/base_model.dart';
import 'package:admin_management/ui/dashboard_screen/dashboard.dart';
import 'package:admin_management/ui/product/products_list/view/product_list.dart';
import 'package:admin_management/ui/product/upload_product/view/upload_product.dart';
import 'package:admin_management/ui/settings/view/settings.dart';

class HomeViewModel extends BaseModel {
  var currentIndex = 3;

  var screens = [
    const DashboardScreen(),
    const ProductsScreen(),
    const UploadProductScreen(),
    const SettingsScreen(),
  ];

  void selectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
