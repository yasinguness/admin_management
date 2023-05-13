import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? surname;
  String? email;
  String? phone;
  String? password;
  bool? isAdmin;
  String? profileImage;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.surname,
      this.email,
      this.phone,
      this.password,
      this.isAdmin,
      this.profileImage,
      this.createdAt,
      this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<dynamic, dynamic> toJson() => _$UserModelToJson(this);
}
