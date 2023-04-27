import 'package:admin_management/network/model/coffee.dart';
import 'package:admin_management/network/model/treat.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  String? ordersOwner;
  List<Coffee>? coffeeList;
  List<Treat>? treatList;
  int? tableNumber;
  double? totalPrice;
  DateTime? time;
  bool? isPreparing;
  bool? isCompleted;

  Order({this.id, this.coffeeList, this.treatList, this.time});
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<dynamic, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return ("Sipariş Numarası : ${id!.substring(1, 9)}");
  }
}
