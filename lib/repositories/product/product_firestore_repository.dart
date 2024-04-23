import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/core/constants/firestore_keys.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/repositories/product/product.dart';

class ProductFirestoreRepository implements ProductRepositoryInterface {
  const ProductFirestoreRepository({required this.db});

  final FirebaseFirestore db;

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      final productSnapshot = await db
          .collection(FirestoreCollection.products)
          .where(FirestoreField.categoryId, isEqualTo: categoryId)
          .get();
      final productDocs = productSnapshot.docs;

      final products =
          productDocs.map((e) => Product.fromJson(e.data())).toList();

      // categories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return products;
    } catch (e) {
      debugPrint('error: $e');
      return [];
    }
  }

  @override
  Future<Product> getProductById(String productId) async {
    try {
      final productSnapshot = await db
          .collection(FirestoreCollection.products)
          .doc(productId)
          .get();
      final productData = productSnapshot.data();

      if (productData == null) {
        throw Exception('Не найден продукт в базе данных');
      }

      return Product.fromJson(productData);
    } catch (e) {
      debugPrint('error: $e');
      rethrow;
    }
  }
}
