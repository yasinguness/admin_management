import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/product/upload_product/view_model/upload_product_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
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
              Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
                  child: model.selectedFile != null
                      ? CachedNetworkImage(fit: BoxFit.contain, imageUrl: model.selectedFile!.path)
                      : const Center(child: Text("Bir resim seçiniz"))),
              const SizedBox(
                height: 20,
              ),
              _fileUpload(model),
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
                context.router.push(const ProductsRoute());

//                await Navigator.pushNamed(context, RouteConst.productLists);
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

  InkWell _fileUpload(UploadProductViewModel model) {
    return InkWell(
      onTap: () {
        model.selectFile();
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
