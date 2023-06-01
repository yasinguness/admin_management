import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  String? id;
  String? name;
  String? description;
  String? image;
  String? size;
  double? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? isSweet;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.isSweet});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, image, size, price, createdAt, updatedAt, isSweet];
}
