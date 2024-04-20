// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      reviewId: json['review_id'] as String,
      productId: json['product_id'] as String,
      userId: json['user_id'] as String,
      comment: json['comment'] as String,
      rating: json['rating'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'review_id': instance.reviewId,
      'product_id': instance.productId,
      'user_id': instance.userId,
      'comment': instance.comment,
      'rating': instance.rating,
      'created_at': instance.createdAt.toIso8601String(),
    };
