import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class ProductListViewModel extends BaseModel {
  ProductService? productService;
  ProductListViewModel({this.productService});

  List<ProductModel>? productList;
  List<ProductModel>? sweetList;
  List<ProductModel>? coffeeList;

  bool? isUpdated;
  Future getProducts() async {
    setBusy(true);
    productList = await productService!.fetchProducts();
    setBusy(false);
  }

  Future init() async {
    await getProducts();
    await getCoffee();
    await getSweet();
  }

  Future getCoffee() async {
    setBusy(true);
    coffeeList = await productService!.getCoffee();
    setBusy(false);
  }

  Future getSweet() async {
    setBusy(true);
    sweetList = await productService!.getSweet();
    setBusy(false);
  }

  Future deleteProduct(String id) async {
    setBusy(true);
    await productService!.deleteProduct(id);
    setBusy(false);
  }

  Future updateProduct(String id, ProductModel model) async {
    setBusy(true);
    isUpdated = await productService!.updateProduct(id, model);
    setBusy(false);
    return isUpdated;
  }
}
