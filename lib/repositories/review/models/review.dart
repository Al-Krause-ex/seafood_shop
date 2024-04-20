import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review extends Equatable {
  const Review({
    required this.reviewId,
    required this.productId,
    required this.userId,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  @JsonKey(name: 'review_id')
  final String reviewId;
  @JsonKey(name: 'product_id')
  final String productId;
  @JsonKey(name: 'user_id')
  final String userId;
  final String comment;
  final int rating;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  Review copyWith({
    String? reviewId,
    String? productId,
    String? userId,
    String? comment,
    int? rating,
    DateTime? createdAt,
  }) {
    return Review(
      reviewId: reviewId ?? this.reviewId,
      productId: productId ?? this.productId,
      userId: userId ?? this.userId,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  List<Object> get props {
    return [
      reviewId,
      productId,
      userId,
      comment,
      rating,
      createdAt,
    ];
  }
}
