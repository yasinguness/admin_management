import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/ui/product/products_list/view_model/product_list_view_model.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatelessWidget {
  final ProductModel product;

  const UpdateProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController priceText = TextEditingController(text: product.price.toString());
    final TextEditingController smallPrice = TextEditingController(text: product.smallPrice.toString());
    final TextEditingController largePrice = TextEditingController(text: product.largePrice.toString());
    final TextEditingController nameText = TextEditingController(text: product.name);
    final TextEditingController descriptionText = TextEditingController(text: product.description);

    var size = MediaQuery.of(context).size;
    ProductListViewModel productListViewModel = ProductListViewModel();
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
            if (product.isSweet == "coffee") ...[
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
            ] else if (product.isSweet == "sweet") ...[
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
                    onPressed: () {
                      productListViewModel.updateProduct(product.id!, product);
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
