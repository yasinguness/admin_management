import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class ProductListViewModel extends BaseModel {
  ProductService? productService;
  ProductListViewModel({this.productService});

  List<ProductModel>? productList;

  Future getProducts() async {
    setBusy(true);
    productList = await productService!.fetchProducts();
    setBusy(false);
  }
}
