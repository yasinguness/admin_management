import 'dart:async';

import 'package:admin_management/common/provider/order_provider.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:admin_management/network/services/order/order_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class DashboardViewModel extends BaseModel {
  OrderService? orderService;
  DashboardViewModel({this.orderService, this.orderProvider});

  OrderProvider? orderProvider;

  //List<OrderModel>? orders;

  StreamSubscription<List<OrderModel>>? ordersStreamSubscription;

  OrderModel? order;
  OrderModel? iProgressOrder;
  OrderModel? completedOrder;

  bool isSelected = false;
  int indexx = 0;

  Future getOrder(String id) async {
    setBusy(true);
    order = await orderService!.getOrderById(id);
    setBusy(false);
  }

  Future getInProgress(String id) async {
    setBusy(true);
    iProgressOrder = await orderService!.getOrderById(id);
    setBusy(false);
  }

  Future getCompleted(String id) async {
    setBusy(true);
    completedOrder = await orderService!.getOrderById(id);
    setBusy(false);
  }

  Future deleteOrder(String id) async {
    await orderService!.deleteOrder(id);
  }

/*   Future fetchOrders() async {
    setBusy(true);
    orders = await orderService!.getPendingList();
    orderProvider!.ordersList.addAll(orders!);
    await getOrder(orderProvider!.ordersList.first.id!);
    setBusy(false);
  } */

  void fetchOrders() {
    setBusy(true);
    ordersStreamSubscription = orderService!.getPendingList().listen((orders) {
      orderProvider!.orderList(orders);
      getOrder(orders.first.id!);
      setBusy(false);
    }, onError: (error) {
      print(error);
    });
  }

  @override
  void dispose() {
    ordersStreamSubscription?.cancel();
    super.dispose();
  }

  addOrderToInProgressList(OrderModel model) {
    orderProvider!.addOrderToInProgressList(model);
  }

  addOrderToCompletedList(OrderModel model) {
    orderProvider!.addOrderToCompletedList(model);
  }

  completed(OrderModel model) {
    model.status = "completed";
    orderService!.updateOrder(model.id!, model.status!);
    orderProvider!.completedOrder(model);
  }
}
