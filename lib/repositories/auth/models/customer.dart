import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer extends Equatable {
  const Customer({
    required this.customerId,
    required this.name,
    required this.email,
    required this.avatar,
  });

  @JsonKey(name: 'customer_id')
  final String customerId;
  final String name;
  final String email;
  final String avatar;

  Customer copyWith({
    String? customerId,
    String? name,
    String? email,
    String? avatar,
  }) {
    return Customer(
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  @override
  List<Object> get props => [customerId, name, email, avatar];
}
