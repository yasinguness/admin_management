import 'dart:io';

import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:admin_management/network/services/base_service.dart';

class OrderService extends BaseService {
  Future<List<OrderModel>?> fetchOrders() async {
    final response = await dio.get('$BASE_URL/order/get-order');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => OrderModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  //List<OrderModel> postFromJson(data) => List<OrderModel>.from(data.map((x) => OrderModel.fromJson(x)));

  Future postOrder(OrderModel order) async {
    try {
      final response = await dio.post<dynamic>('$BASE_URL/product/create', data: order.toJson());
      if (response.statusCode == HttpStatus.ok) {
        var data = response.data;
        OrderModel.fromJson(data);
      }
    } catch (e) {
      print("Sipariş verilemedi");
      rethrow;
    }
  }

  Future<OrderModel?> getOrderById(String id) async {
    try {
      final response = await dio.get("$BASE_URL/order/$id");
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data['data'][0];

        return OrderModel.fromJson(data);
      }
    } catch (e) {
      print("Servis hata");
    }
    return null;
  }
}
