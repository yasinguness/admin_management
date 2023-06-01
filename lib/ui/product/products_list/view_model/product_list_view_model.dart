import 'dart:async';

import 'package:admin_management/common/provider/product_provider.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class ProductListViewModel extends BaseModel {
  ProductService productService;
  ProductListViewModel({required this.productService, this.productProvider});
  ProductProvider? productProvider;
  List<ProductModel>? productList;
  List<ProductModel>? searchProducts;
  List<ProductModel>? sweetList;
  List<ProductModel>? coffeeList;

  final StreamController<List<ProductModel>> _productListController = StreamController<List<ProductModel>>.broadcast();
  Stream<List<ProductModel>> get productListStream => _productListController.stream;

  bool? isUpdated;

/*   final TextEditingController priceText = TextEditingController();
  final TextEditingController smallPrice = TextEditingController();
  final TextEditingController largePrice = TextEditingController();
  final TextEditingController nameText = TextEditingController();
  final TextEditingController descriptionText = TextEditingController(); */

  Future getProducts() async {
    setBusy(true);
    productList = await productService.fetchProducts();
    setBusy(false);
  }

  Future init() async {
    await getProducts();
    await getCoffee();
    await getSweet();
  }

  Future getCoffee() async {
    setBusy(true);
    coffeeList = await productService.getCoffee();
    setBusy(false);
  }

  Future getSweet() async {
    setBusy(true);
    sweetList = await productService.getSweet();
    setBusy(false);
  }

  Future deleteProduct(String id) async {
    setBusy(true);
    await productService.deleteProduct(id);
    setBusy(false);
  }

  Future updateProduct(String id, ProductModel model) async {
    setBusy(true);
    productProvider!.update(model);
    //TODO:ürün güncellendiğnide ekrana güncel hali düşmüyor
    isUpdated = await productService.updateProduct(id, productProvider!.product);
    setBusy(false);
    return isUpdated;
  }

  Future searchProduct(String query) async {
    setBusy(true);
    productList = await productService.searchProduct(query);
    _productListController.sink.add(productList!);
    setBusy(false);
  }

  @override
  void dispose() {
    _productListController.close();
    super.dispose();
  }
}
