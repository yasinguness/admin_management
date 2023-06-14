// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'order_statistics.g.dart';

@JsonSerializable()
class OrderStatisticsModel {
  String? mostOrderedCoffee;
  int? mostOrderedCoffeeAmount;
  String? mostOrderedDessert;
  int? mostOrderedDessertAmount;
  int? dailyTotalOrderAmount;
  int? totalCoffeeOrders;
  int? totalDessertOrders;
  int? totalOrderAmount;

  OrderStatisticsModel({
    this.mostOrderedCoffee,
    this.mostOrderedCoffeeAmount,
    this.mostOrderedDessert,
    this.mostOrderedDessertAmount,
    this.dailyTotalOrderAmount,
    this.totalCoffeeOrders,
    this.totalDessertOrders,
    this.totalOrderAmount,
  });

  factory OrderStatisticsModel.fromJson(Map<String, dynamic> json) => _$OrderStatisticsModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$OrderStatisticsModelToJson(this);
}
