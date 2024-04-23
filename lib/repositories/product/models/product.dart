import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({
    required this.productId,
    required this.categoryId,
    required this.name,
    required this.taste,
    required this.origin,
    required this.nutrients,
    required this.avatar,
    required this.imageUrls,
    required this.price,
    required this.rating,
  });

  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'category_id')
  final String categoryId;
  final String name;
  final String taste;
  final String origin;
  final String nutrients;
  final String avatar;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  final int price;
  final double rating;

  Product copyWith({
    String? productId,
    String? categoryId,
    String? name,
    String? taste,
    String? origin,
    String? nutrients,
    String? avatar,
    List<String>? imageUrls,
    int? price,
    double? rating,
  }) {
    return Product(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      taste: taste ?? this.taste,
      origin : origin ?? this.origin,
      nutrients : nutrients ?? this.nutrients,
      avatar: avatar ?? this.avatar,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      rating: rating ?? this.rating,
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
      taste,
      origin,
      nutrients,
      avatar,
      imageUrls,
      price,
      rating,
    ];
  }
}
