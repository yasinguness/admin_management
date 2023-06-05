import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class CustomerModel extends Equatable {
  final String? id;
  final String? name;
  final String? qrNo;
  final List<String>? orders;

  const CustomerModel({this.id, this.name, this.qrNo, this.orders});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, qrNo, orders];
}
