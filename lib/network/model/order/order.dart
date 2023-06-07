// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:admin_management/network/model/customer/customer.dart';
import 'package:admin_management/network/model/order_product/order_product.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderModel {
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

  /*  @override
  // TODO: implement props
  List<Object?> get props => [id, customer, products, status, createdAt, updatedAt, totalPrice]; */

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.customer == customer &&
        listEquals(other.products, products) &&
        other.status == status &&
        other.totalPrice == totalPrice &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        customer.hashCode ^
        products.hashCode ^
        status.hashCode ^
        totalPrice.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
