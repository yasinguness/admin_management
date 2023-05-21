import 'package:admin_management/common/provider/order_provider.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class DashboardViewModel extends BaseModel {
  OrderService? orderService;

  DashboardViewModel({this.orderService, this.orderProvider});

  OrderProvider? orderProvider;

  List<OrderModel>? orders;

  OrderModel? order;
  bool isSelected = false;
  int indexx = 0;

  Future getOrder(String id) async {
    setBusy(true);
    order = await orderService!.getOrderById(id);
    setBusy(false);
  }

  Future fetchOrders() async {
    setBusy(true);
    orders = await orderService!.fetchOrders();
    orderProvider!.ordersList = orders!;
    await getOrder(orders!.first.id!);
    setBusy(false);
  }

  Future addOrderToInProgressList(OrderModel model) async {
    orderProvider!.addOrderToInProgressList(model);
    setBusy(false);
  }

  Future addOrderToCompletedList(OrderModel model) async {
    orderProvider!.addOrderToCompletedList(model);
    setBusy(false);
  }
}