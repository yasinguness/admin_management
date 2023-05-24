import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable()
class CustomerModel extends Equatable {
  String? id;
  String? name;
  String? qrNo;
  CustomerModel({this.id, this.name, this.qrNo});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$CustomerModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, qrNo];
}
