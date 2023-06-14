import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/ui/product/products_list/view/update_product.dart';
import 'package:admin_management/ui/product/products_list/view_model/product_list_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductListViewModel value;
  final String imageUrl;
  final String productName;
  final String productDescription;
  final String productPrice;
  final ProductModel productModel;
  final int index;
  const ProductCardWidget(
      {super.key,
      required this.value,
      required this.imageUrl,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl, //value.productList![index].image!.path,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            productName, // value.productList![index].name!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        )),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Text(
                          productDescription, // value.productList![index].description ?? " ",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20),
                        ))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          productPrice, // "${value.productList![index].price.toString()} ₺",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor: Colors.brown.shade400,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return UpdateProductScreen(product: productModel /* value.productList![index] */);
                                    },
                                  );
                                },
                                child: const Text("Düzenle")))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(actions: [
                  TextButton(
                      onPressed: () {
                        value.deleteProduct(productModel.id!);
                        context.router.pop(context);
                        value.productList!.removeAt(index);
                      },
                      child: const Text("Evet")),
                  TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: const Text("Hayır"))
                ], content: const Text("Ürünü silmek istediğinize emin misiniz ?")),
              );
            },
            child: Container(
              width: 30,
              height: 30,
              //margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const <BoxShadow>[BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 15)]),
              child: Icon(
                Icons.delete,
                color: Colors.red.shade400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
