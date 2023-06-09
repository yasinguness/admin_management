// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_management/network/model/order_statistic/order_statistics.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/network/services/product/product_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class OrderStatisticViewModel extends BaseModel {
  OrderService? orderService;
  ProductService? productService;
  OrderStatisticViewModel({
    this.orderService,
    this.productService,
  });

  OrderStatisticsModel? model;

  ProductModel? mostCoffee;
  ProductModel? mostSweet;

  Future getStatistics() async {
    setBusy(true);
    model = await orderService!.getStatistics();
    await getCoffee();
    await getSweet();
    setBusy(false);
  }

  Future getCoffee() async {
    mostCoffee = await productService!.getProductById(model!.mostOrderedCoffee!);
  }

  Future getSweet() async {
    mostSweet = await productService!.getProductById(model!.mostOrderedDessert!);
  }
}
