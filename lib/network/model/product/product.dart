// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  String? id;
  String? name;
  String? description;
  @JsonKey(fromJson: _fileFromJson, toJson: _fileToJson)
  XFile? image;
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

  static XFile? _fileFromJson(String? filePath) => filePath != null ? XFile(filePath) : null;
  static String? _fileToJson(XFile? file) => file?.path;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, image, size, price, createdAt, updatedAt, isSweet];
}
