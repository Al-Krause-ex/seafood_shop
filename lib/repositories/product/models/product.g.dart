// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['product_id'] as String,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
      taste: json['taste'] as String,
      origin: json['origin'] as String,
      nutrients: json['nutrients'] as String,
      avatar: json['avatar'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.productId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'taste': instance.taste,
      'origin': instance.origin,
      'nutrients': instance.nutrients,
      'avatar': instance.avatar,
      'image_urls': instance.imageUrls,
      'price': instance.price,
      'rating': instance.rating,
    };
