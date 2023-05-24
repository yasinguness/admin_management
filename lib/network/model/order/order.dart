import 'package:admin_management/network/model/customer/customer.dart';
import 'package:admin_management/network/model/product/product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';

@JsonSerializable()
class OrderModel extends Equatable {
  String? id;
  CustomerModel? customer;
  List<ProductModel>? products;
  String? status;
  String? createdAt;
  String? updatedAt;
  OrderModel({this.id, this.customer, this.products, this.status, this.createdAt, this.updatedAt});

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, customer, products, status, createdAt, updatedAt];

/*   @override
  // TODO: implement props
  List<Object?> get props => [
        customer,
        products,
      ]; */
/*   @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        id == other.id &&
        customer == other.customer &&
        listEquals(products, other.products) &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      customer,
      Object.hashAll(products!),
      status,
      createdAt,
      updatedAt,
    );
  } */
}
