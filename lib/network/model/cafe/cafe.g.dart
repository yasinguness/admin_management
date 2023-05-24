// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeModel _$CafeModelFromJson(Map<String, dynamic> json) => CafeModel(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CafeModelToJson(CafeModel instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'products': instance.products,
      'employees': instance.employees,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
