// ignore_for_file: must_be_immutable

import 'package:admin_management/network/model/product/product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_product.g.dart';

@JsonSerializable()
class OrderProductModel extends Equatable {
  int? amount;
  double? currentPrice;
  String? selectedSize;
  ProductModel? product;

  OrderProductModel({this.amount, this.product, this.currentPrice, this.selectedSize});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$OrderProductModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [amount, currentPrice, selectedSize, product];
}
