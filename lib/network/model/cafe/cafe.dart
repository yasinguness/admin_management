import 'package:admin_management/network/model/employee/employee.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cafe.g.dart';

@JsonSerializable()
class CafeModel {
  String? sId;
  String? name;
  String? address;
  String? phone;
  List<ProductModel>? products;
  List<EmployeeModel>? employees;
  String? createdAt;
  String? updatedAt;

  CafeModel(
      {this.sId, this.name, this.address, this.phone, this.products, this.employees, this.createdAt, this.updatedAt});

  factory CafeModel.fromJson(Map<String, dynamic> json) => _$CafeModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$CafeModelToJson(this);
}
