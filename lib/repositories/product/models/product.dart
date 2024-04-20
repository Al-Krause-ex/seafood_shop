import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({
    required this.productId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.avatar,
    required this.imageUrls,
    required this.price,
    required this.count,
  });

  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String name;
  final String description;
  final String avatar;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  final int price;
  final int count;

  Product copyWith({
    String? productId,
    String? categoryId,
    String? name,
    String? description,
    String? avatar,
    List<String>? imageUrls,
    int? price,
    int? count,
  }) {
    return Product(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object> get props {
    return [
      productId,
      categoryId,
      name,
      description,
      avatar,
      imageUrls,
      price,
      count,
    ];
  }
}
