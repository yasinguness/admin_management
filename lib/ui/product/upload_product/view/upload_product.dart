import 'dart:io';

import 'package:admin_management/common/constants/route_const.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/product/upload_product/view_model/upload_product_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  File? selectedFile;
  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseView<UploadProductViewModel>(
      model: UploadProductViewModel(
        productService: locator<ProductService>(),
      ),
      builder: (context, value, widget) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(context), _fields(value)],
      ),
    );
  }

  Expanded _fields(UploadProductViewModel model) {
    return Expanded(
      flex: 9,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _fileUpload(),
              const SizedBox(
                height: 20,
              ),
              UploadField(hintText: "Product Name", controller: model.name, keyboardType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              UploadField(
                hintText: "Price",
                controller: model.price,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, color: const Color.fromARGB(255, 103, 102, 102)),
                decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                value: model.isSweet.text = "coffee",
                items: const [
                  DropdownMenuItem(value: "sweet", child: Text("Sweet")),
                  DropdownMenuItem(value: "coffee", child: Text("Coffee")),
                ],
                onChanged: (value) {
                  print(value);
                  model.isSweet.text = value.toString();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, color: const Color.fromARGB(255, 103, 102, 102)),
                decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
                value: model.productSize.text = 'S',
                items: const [
                  DropdownMenuItem(value: "S", child: Text("Small")),
                  DropdownMenuItem(value: "M", child: Text("Medium")),
                  DropdownMenuItem(value: "L", child: Text("Large")),
                ],
                onChanged: (value) {
                  print(value);
                  model.productSize.text = value.toString();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: model.description,
                maxLines: 4,
                decoration: const InputDecoration(
                    hintText: "Product Description", border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              ),
              const SizedBox(
                height: 10,
              ),
              _addProductButton(model)
            ],
          ),
        ),
      ),
    );
  }

  Align _addProductButton(UploadProductViewModel model) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            bool isAdd = await model.addProduct();
            if (isAdd) {
              if (mounted) {
                await Navigator.pushNamed(context, RouteConst.productLists);
              } else {
                const AlertDialog(
                  content: Text("İşlem Başarısız"),
                );
              }
            }
            //Navigator.pushNamed(context, RouteConst.productLists);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: const Text(
            "Ürün Ekle",
          ),
        ),
      ),
    );
  }

  Expanded _title(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Upload Product",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.brown.shade500, fontSize: 36),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _fileUpload() {
    return InkWell(
      onTap: () {
        selectFile();
      },
      child: const TextField(
        enabled: false,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.file_upload_sharp),
            hintText: "Upload Image",
            border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
      ),
    );
  }
}

class UploadField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const UploadField({
    Key? key,
    this.controller,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration:
          InputDecoration(hintText: hintText, border: const OutlineInputBorder(borderSide: BorderSide(width: 1))),
    );
  }
}
