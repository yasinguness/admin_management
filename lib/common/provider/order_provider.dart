import 'package:admin_management/network/model/order/order.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> ordersList = [];

  List<OrderModel> inProgressList = [];
  List<OrderModel> completedList = [];

  void addOrderToInProgressList(OrderModel model) {
    inProgressList.add(model);
    removeOrder(model);
    notifyListeners();
  }

  void removeOrder(OrderModel model) {
    ordersList.remove(model);
    notifyListeners();
  }

  void addOrderToCompletedList(OrderModel model) {
    completedList.add(model);
    inProgressList.remove(model);
    notifyListeners();
  }
}
