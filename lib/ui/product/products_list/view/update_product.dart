import 'package:admin_management/common/provider/product_provider.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/product/products_list/view_model/product_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProduct extends StatefulWidget {
  final ProductModel product;

  const UpdateProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController priceText = TextEditingController();
  TextEditingController smallPrice = TextEditingController();
  TextEditingController largePrice = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();
  @override
  void initState() {
    descriptionText.text = widget.product.description!;
    nameText.text = widget.product.name!;
    priceText.text = widget.product.price!.toString();
    smallPrice.text = widget.product.smallPrice!.toString();
    largePrice.text = widget.product.largePrice!.toString();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ProductListViewModel productListViewModel = ProductListViewModel(
        productService: locator<ProductService>(), productProvider: Provider.of<ProductProvider>(context));
    initState();
    return AlertDialog(
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        width: size.width * 0.3,
        height: size.height * 0.8,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ürün Güncelle",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            _image(),
            _uploadImageButton(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: nameText,
                decoration: const InputDecoration(
                    labelText: "Product Name", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),
            ),
            if (widget.product.isSweet == "coffee") ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: smallPrice,
                  decoration: const InputDecoration(
                      labelText: "Small Price", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: priceText,
                  decoration: const InputDecoration(
                      labelText: "Price", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: largePrice,
                  decoration: const InputDecoration(
                      labelText: "Large Price", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: descriptionText,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      labelText: "Description", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
              ),
            ] else if (widget.product.isSweet == "sweet") ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: priceText,
                  decoration: const InputDecoration(
                      labelText: "Price", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
                ),
              )
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () async {
                      widget.product.name = nameText.text;
                      widget.product.description = descriptionText.text;
                      widget.product.price = double.parse(priceText.text);
                      widget.product.smallPrice = double.parse(smallPrice.text);
                      widget.product.largePrice = double.parse(largePrice.text);

                      bool isUpdated = await productListViewModel.updateProduct(widget.product.id!, widget.product);
                      if (isUpdated) {
                        setState(() {
                          Navigator.pop(context);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Güncellenemedi")));
                      }
                      //TODO: Düzenle isteği çalışmıyor
                    },
                    child: const Text("Güncelle")),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _image() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        "assets/images/GLASS-2.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Padding _uploadImageButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          onPressed: () {
            //TODO:File işlemleri
          },
          child: const Text("Yükle")),
    );
  }
}
