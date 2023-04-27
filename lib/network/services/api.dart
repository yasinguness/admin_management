import 'dart:convert';

import 'package:admin_management/network/model/order.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = "http://192.168.1.36:3000";

  var https = http.Client();

  Future<List<Order>> fetchOrders() async {
    var lists = <Order>[];
    final response = await https.get((Uri.parse("$_baseUrl/order")));
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List<dynamic>;
      for (var parse in parsed) {
        lists.add(Order.fromJson(parse));
      }
      return lists;
    } else {
      throw Exception("Hata oluştu");
    }
  }

  Future<Order> getOrder(String orderId) async {
    var response = await https.get(Uri.parse("$_baseUrl/order/$orderId"));
    var parsed = Order.fromJson(jsonDecode(response.body));
    return parsed;
  }
}
