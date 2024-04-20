import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

enum Gender {
  @JsonValue("male")
  male,
  @JsonValue("female")
  female,
  @JsonValue("none")
  none,
}

@JsonSerializable()
class Customer extends Equatable {
  const Customer({
    required this.userId,
    required this.roleId,
    required this.firstName,
    required this.secondName,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.gender,
  });

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'role_id')
  final String roleId;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'second_name')
  final String secondName;
  final String phone;
  final String email;
  final String avatar;
  final Gender gender;

  Customer copyWith({
    String? userId,
    String? roleId,
    String? firstName,
    String? secondName,
    String? phone,
    String? email,
    String? avatar,
    Gender? gender,
  }) {
    return Customer(
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      gender: gender ?? this.gender,
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  @override
  List<Object> get props {
    return [
      userId,
      roleId,
      firstName,
      secondName,
      phone,
      email,
      avatar,
      gender,
    ];
  }
}
