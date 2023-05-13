import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable()
class EmployeeModel {
  int? id;
  String? name;

  EmployeeModel({this.id, this.name});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$EmployeeModelToJson(this);
}
