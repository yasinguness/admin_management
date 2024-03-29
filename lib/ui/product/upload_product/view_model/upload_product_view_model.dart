import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

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
  XFile? selectedFile;

  void selectFile() async {
    var result = await ImagePickerPlugin().getImage(source: ImageSource.gallery);

    selectedFile = result;
  }

  Future addProduct() async {
    setBusy(true);
    ProductModel model = ProductModel(
        image: selectedFile,
        name: name.text,
        description: description.text,
        price: double.parse(price.text),
        size: productSize.text,
        isSweet: isSweet.text);
    bool? isAdded = await productService!.createProduct(model);
    setBusy(false);
    return isAdded!;
  }
}
