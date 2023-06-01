import 'dart:io';

import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/base_service.dart';
import 'package:admin_management/network/services/shared_pref.dart';
import 'package:dio/dio.dart';

class ProductService extends BaseService {
  Future<List<ProductModel>?> fetchProducts() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response = await dio.get("$BASE_URL/product", options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future deleteProduct(String id) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    try {
      final response = await dio.delete("$BASE_URL/product/delete-product/$id",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == HttpStatus.ok) {
        print("Ürün Silindi");
      }
    } catch (e) {
      print("Hata $e");
    }
  }

  Future<bool?> updateProduct(String id, ProductModel? model) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    try {
      var updateData = {
        "name": model?.name,
        "description": model?.description,
        "price": model?.price,
      };
      final response = await dio.put("$BASE_URL/product/update-product/$id",
          data: updateData, options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == HttpStatus.ok) {
        print("Ürün Güncellendi");
        return true;
      }
    } catch (e) {
      print("Hata! $e");
      return false;
    }
    return null;
  }

  Future<bool?> createProduct(ProductModel model) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    try {
      final createModel = {
        "name": model.name,
        "description": model.description,
        "price": model.price,
        "size": model.size,
        "isSweet": model.isSweet
      };
      final response = await dio.post("$BASE_URL/product/create",
          data: createModel, options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == HttpStatus.created) {
        print("Ürün Eklendi");
        return true;
      }
    } catch (e) {
      print("Hata! ${e.toString()}");
      return false;
    }
    return null;
  }

  Future<List<ProductModel>> searchProduct(String searchTerm) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    try {
      final response = await dio.get('/product/search',
          queryParameters: {'q': searchTerm}, options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];

        final List<ProductModel> products = data.map((json) => ProductModel.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to search products');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ProductModel>?> getSweet() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response =
        await dio.get('$BASE_URL/product/sweets', options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future<List<ProductModel>?> getCoffee() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response =
        await dio.get('$BASE_URL/product/coffees', options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
