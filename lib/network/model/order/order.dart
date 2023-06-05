// ignore_for_file: must_be_immutable

import 'package:admin_management/network/model/customer/customer.dart';
import 'package:admin_management/network/model/order_product/order_product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class OrderModel extends Equatable {
  String? id;
  CustomerModel? customer;
  List<OrderProductModel>? products;
  String? status;
  double? totalPrice;
  String? createdAt;
  String? updatedAt;
  OrderModel({this.id, this.customer, this.products, this.status, this.createdAt, this.updatedAt, this.totalPrice});

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, customer, products, status, createdAt, updatedAt, totalPrice];
}
