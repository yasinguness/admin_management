import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';
import 'package:flutter/material.dart';

class UploadProductViewModel extends BaseModel {
  ProductService? productService;

  UploadProductViewModel({this.productService});

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController smallPrice = TextEditingController();
  TextEditingController largePrice = TextEditingController();
  TextEditingController isSweet = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController productSize = TextEditingController();

  Future addProduct() async {
    ProductModel model = ProductModel(
        image: "assets/images/GLASS-2.png",
        name: name.text,
        description: description.text,
        largePrice: double.parse(largePrice.text),
        price: double.parse(price.text),
        smallPrice: double.parse(smallPrice.text),
        size: productSize.text,
        isSweet: isSweet.text);
    bool? isAdded = await productService!.createProduct(model);
    setBusy(false);
    return isAdded!;
  }
}
