import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/core/constants/firestore_keys.dart';
import 'package:seafood_shop/repositories/category/category.dart';
import 'package:seafood_shop/repositories/category/models/models.dart';

class CategoryFirestoreRepository implements CategoryRepositoryInterface {
  const CategoryFirestoreRepository({required this.db});

  final FirebaseFirestore db;

  @override
  Future<List<Category>> getCategories() async {
    try {
      final categorySnapshot =
          await db.collection(FirestoreCollection.categories).get();
      final categoryDocs = categorySnapshot.docs;

      final categories =
          categoryDocs.map((e) => Category.fromJson(e.data())).toList();

      categories.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return categories;
    } catch (e) {
      debugPrint('error: $e');
      return [];
    }
  }
}
