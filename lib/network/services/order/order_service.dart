import 'dart:io';

import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/order/order.dart';
import 'package:admin_management/network/model/order_statistic/order_statistics.dart';
import 'package:admin_management/network/services/base_service.dart';
import 'package:admin_management/network/services/shared_pref.dart';
import 'package:dio/dio.dart';

class OrderService extends BaseService {
  Future<List<OrderModel>> fetchOrders() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response =
        await dio.get('$BASE_URL/order/get-order', options: Options(headers: {'Authorization': "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => OrderModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  Future<List<OrderModel>> getPendingList() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response =
        await dio.get('$BASE_URL/order/pending', options: Options(headers: {'Authorization': "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => OrderModel.fromJson(e)).toList();
      }
    }
    return [];
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
      SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
      var token = shared.getString("token");
      final response =
          await dio.get("$BASE_URL/order/$id", options: Options(headers: {'Authorization': "Bearer $token"}));
      if (response.statusCode == HttpStatus.ok) {
        return OrderModel.fromJson(response.data["data"]);
      }
    } catch (e) {
      print("Servis hata");
    }
    return null;
  }

  Future<bool?> deleteOrder(String id) async {
    try {
      SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
      var token = shared.getString("token");
      final response = await dio.delete("$BASE_URL/order/delete-order/$id",
          options: Options(headers: {'Authorization': "Bearer $token"}));
      if (response.statusCode == HttpStatus.ok) {
        print("Sipariş Silindi");
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return null;
  }

  Future<OrderStatisticsModel?> getStatistics() async {
    try {
      SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
      var token = shared.getString("token");
      final response = await dio.get("$BASE_URL/order-statistics/get-statistics",
          options: Options(headers: {'Authorization': "Bearer $token"}));
      if (response.statusCode == HttpStatus.ok) {
        var data = response.data['data'];
        return OrderStatisticsModel.fromJson(data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<bool?> updateOrder(String id, String status) async {
    try {
      var data = {"status": status};

      SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
      var token = shared.getString("token");
      final response = await dio.put(
        "$BASE_URL/order/update/$id",
        options: Options(headers: {'Authorization': "Bearer $token"}),
        data: data,
      );
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return null;
  }
}
