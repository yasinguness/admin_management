// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatisticsModel _$OrderStatisticsModelFromJson(
        Map<String, dynamic> json) =>
    OrderStatisticsModel(
      mostOrderedCoffee: json['mostOrderedCoffee'] as String?,
      mostOrderedCoffeeAmount: json['mostOrderedCoffeeAmount'] as int?,
      mostOrderedDessert: json['mostOrderedDessert'] as String?,
      mostOrderedDessertAmount: json['mostOrderedDessertAmount'] as int?,
      dailyTotalOrderAmount: json['dailyTotalOrderAmount'] as int?,
      totalCoffeeOrders: json['totalCoffeeOrders'] as int?,
      totalDessertOrders: json['totalDessertOrders'] as int?,
    );

Map<String, dynamic> _$OrderStatisticsModelToJson(
        OrderStatisticsModel instance) =>
    <String, dynamic>{
      'mostOrderedCoffee': instance.mostOrderedCoffee,
      'mostOrderedCoffeeAmount': instance.mostOrderedCoffeeAmount,
      'mostOrderedDessert': instance.mostOrderedDessert,
      'mostOrderedDessertAmount': instance.mostOrderedDessertAmount,
      'dailyTotalOrderAmount': instance.dailyTotalOrderAmount,
      'totalCoffeeOrders': instance.totalCoffeeOrders,
      'totalDessertOrders': instance.totalDessertOrders,
    };
