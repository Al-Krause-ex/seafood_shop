// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      userId: json['user_id'] as String,
      roleId: json['role_id'] as String,
      firstName: json['first_name'] as String,
      secondName: json['second_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'user_id': instance.userId,
      'role_id': instance.roleId,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'phone': instance.phone,
      'email': instance.email,
      'avatar': instance.avatar,
      'gender': _$GenderEnumMap[instance.gender]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.none: 'none',
};
