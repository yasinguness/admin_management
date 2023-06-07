// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class CustomerModel {
  final String? id;
  final String? name;
  final String? qrNo;
  final List<String>? orders;

  const CustomerModel({this.id, this.name, this.qrNo, this.orders});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.qrNo == qrNo && listEquals(other.orders, orders);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ qrNo.hashCode ^ orders.hashCode;
  }
}
