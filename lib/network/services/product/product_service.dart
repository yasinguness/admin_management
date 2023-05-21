import 'dart:io';

import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/base_service.dart';

class ProductService extends BaseService {
  Future<List<ProductModel>?> fetchProducts() async {
    final response = await dio.get("$BASE_URL/product");

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future deleteProduct(String id) async {
    try {
      final response = await dio.delete("$BASE_URL/product/delete-product/$id");
      if (response.statusCode == HttpStatus.ok) {
        print("Ürün Silindi");
      }
    } catch (e) {
      print("Hata $e");
    }
  }

  Future<bool?> updateProduct(String id, ProductModel model) async {
    try {
      final response = await dio.put("$BASE_URL/product/update-product/$id", data: model.toJson());
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
    try {
      final createModel = {
        "name": model.name,
        "description": model.description,
        "price": model.price,
        "smallPrice": model.smallPrice,
        "largePrice": model.largePrice,
        "size": model.size,
        "isSweet": model.isSweet
      };
      final response = await dio.post("$BASE_URL/product/create", data: createModel);
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

  Future<List<ProductModel>?> getSweet() async {
    final response = await dio.get('$BASE_URL/product/sweets');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  Future<List<ProductModel>?> getCoffee() async {
    final response = await dio.get('$BASE_URL/product/coffees');

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];
      if (datas is List) {
        return datas.map((e) => ProductModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
