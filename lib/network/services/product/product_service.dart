import 'dart:io';

import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:admin_management/network/services/base_service.dart';
import 'package:admin_management/network/services/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse("$BASE_URL/product/update-product/$id"), // Ürün güncelleme API URL'sini buraya yazın
      );

      Map<String, String> headers = {"Authorization": "Bearer $token"};
      request.headers.addAll(headers);

      request.fields.addAll({"name": model!.name!, "price": model.price.toString(), "description": model.description!});

      if (model.image != null) {
        var img = await model.image!.readAsBytes();
        request.files.add(http.MultipartFile.fromBytes('image', img, filename: "newImage.jpeg"));
      }

      var response = await request.send();

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
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$BASE_URL/product/create"), // Ürün güncelleme API URL'sini buraya yazın
      );

      Map<String, String> headers = {"Authorization": "Bearer $token"};
      request.headers.addAll(headers);
      request.fields.addAll({
        "name": model.name!,
        "price": model.price.toString(),
        "description": model.description!,
        "size": model.size!,
        "isSweet": model.isSweet!
      });

      var img = await model.image!.readAsBytes();
      // Resim dosyasını ekleyin

      request.files.add(http.MultipartFile.fromBytes('image', img, filename: "PostImage.jpeg"));

      // Bearer token'ı ekleyin
      // Kendi Bearer token'ınızı buraya yazın

      var response = await request.send();

      if (response.statusCode == HttpStatus.created) {
        print("Ürün Eklendi");
        return true;
      }
    } catch (e) {
      print("Hata! $e");
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

  Future<ProductModel?> getProductById(String id) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();
    var token = shared.getString("token");
    final response =
        await dio.get('$BASE_URL/product/$id', options: Options(headers: {"Authorization": "Bearer $token"}));

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data['data'];

      return ProductModel.fromJson(datas);
    }
    return null;
  }
}
