import 'package:admin_management/network/model/product/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? product;

  void update(ProductModel model) {
    product = model;
    notifyListeners();
  }
}
