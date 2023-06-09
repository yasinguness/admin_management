import 'package:admin_management/network/model/order/order.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> ordersList = [];

  List<OrderModel> inProgressList = [];
  List<OrderModel> completedList = [];

  void addOrderToInProgressList(OrderModel model) {
    inProgressList.add(model);
    ordersList.removeWhere((order) => order == model);
    notifyListeners();
  }

/* void removeOrder(OrderModel model) {
  ordersList.removeWhere((order) => order == model);
  inProgressList.removeWhere((order) => order == model);
  completedList.removeWhere((order) => order == model);
  notifyListeners();
} */

  void addOrderToCompletedList(OrderModel model) {
    completedList.add(model);
    inProgressList.removeWhere((order) => order == model);
    notifyListeners();
  }

  void completedOrder(OrderModel model) {
    completedList.removeWhere((order) => order == model);
    notifyListeners();
  }
}
