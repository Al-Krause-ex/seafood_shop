import 'package:seafood_shop/repositories/review/models/models.dart';

abstract interface class ReviewRepositoryInterface {
  Future<List<Review>> getReviewsByProduct(String productId);
  Future<void> createReview();
  Future<void> updateReview();
  Future<void> deleteReview();
}
