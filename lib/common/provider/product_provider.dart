import 'package:admin_management/network/model/product/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  ProductModel? product;

  List<ProductModel>? coffeeList = [];

  Future getCoffee(List<ProductModel> coffeeLst) async {
    coffeeList!.addAll(coffeeLst);
    notifyListeners();
  }

  void update(ProductModel model) {
    product = model;
    notifyListeners();
  }
}
