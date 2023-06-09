import 'dart:async';

import 'package:admin_management/network/model/order/order.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  // Stream controllers for order lists
  final StreamController<List<OrderModel>> _ordersListController = StreamController<List<OrderModel>>.broadcast();
  final StreamController<List<OrderModel>> _inProgressListController = StreamController<List<OrderModel>>();
  final StreamController<List<OrderModel>> _completedListController = StreamController<List<OrderModel>>();

  // Streams for order lists
  Stream<List<OrderModel>> get ordersListStream => _ordersListController.stream;
  Stream<List<OrderModel>> get inProgressListStream => _inProgressListController.stream;
  Stream<List<OrderModel>> get completedListStream => _completedListController.stream;

  final List<OrderModel> _ordersList = [];
  final List<OrderModel> _inProgressList = [];
  final List<OrderModel> _completedList = [];

  void _updateOrderLists() {
    _ordersListController.sink.add(_ordersList);
    _inProgressListController.sink.add(_inProgressList);
    _completedListController.sink.add(_completedList);
  }

  void addOrderToInProgressList(OrderModel model) {
    _inProgressList.add(model);
    _ordersList.removeWhere((order) => order == model);
    _updateOrderLists();
    notifyListeners();
  }

  void orderList(List<OrderModel> list) {
    _ordersList.addAll(list);
    _updateOrderLists();
    notifyListeners();
  }

  void addOrderToCompletedList(OrderModel model) {
    _completedList.add(model);
    _inProgressList.removeWhere((order) => order == model);
    _updateOrderLists();

    notifyListeners();
  }

  void completedOrder(OrderModel model) {
    _completedList.removeWhere((order) => order == model);
    _updateOrderLists();

    notifyListeners();
  }

  // Dispose the stream controllers
  @override
  void dispose() {
    super.dispose();

    _ordersListController.close();
    _inProgressListController.close();
    _completedListController.close();
    notifyListeners();
  }
}
