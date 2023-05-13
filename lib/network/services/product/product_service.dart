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
}
