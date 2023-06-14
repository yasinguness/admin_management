import 'package:admin_management/common/provider/product_provider.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/product/products_list/view_model/product_list_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class UpdateProductScreen extends StatefulWidget {
  final ProductModel product;

  const UpdateProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  TextEditingController priceText = TextEditingController();
  TextEditingController smallPrice = TextEditingController();
  TextEditingController largePrice = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();
  @override
  void initState() {
    super.initState();
    descriptionText.text = widget.product.description!;
    nameText.text = widget.product.name!;
    priceText.text = widget.product.price!.toString();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ProductListViewModel productListViewModel = ProductListViewModel(
        productService: locator<ProductService>(), productProvider: Provider.of<ProductProvider>(context));

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
            _uploadImageButton(productListViewModel),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: nameText,
                decoration: const InputDecoration(
                    labelText: "Product Name", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
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
                controller: descriptionText,
                maxLines: 4,
                decoration: const InputDecoration(
                    labelText: "Description", border: OutlineInputBorder(borderSide: BorderSide(width: 2))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    onPressed: () {
                      _isAddedFunc(productListViewModel, context);
                    },
                    child: productListViewModel.busy
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                          )
                        : const Text("Güncelle")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _isAddedFunc(ProductListViewModel productListViewModel, BuildContext context) {
    widget.product.name = nameText.text;
    widget.product.description = descriptionText.text;
    widget.product.price = double.parse(priceText.text);
    widget.product.image = productListViewModel.uploadfile;
    if (!productListViewModel.busy) {
      productListViewModel.updateProduct(widget.product.id!, widget.product).then((isUpdated) {
        if (isUpdated) {
          context.router.pop();
          context.router.push(const ProductsRoute());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Güncellenemedi")));
        }
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("Hata! $error"),
          ),
        );
      });
    }
  }

  SizedBox _image() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CachedNetworkImage(
        imageUrl: widget.product.image!.path,
        fit: BoxFit.cover,
      ),
    );
  }

  Padding _uploadImageButton(ProductListViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          onPressed: () {
            model.selectFile();
          },
          child: const Text("Yükle")),
    );
  }
}
