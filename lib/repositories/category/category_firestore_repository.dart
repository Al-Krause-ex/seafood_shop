import 'package:cloud_firestore/cloud_firestore.dart';
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
      await db.collection(FirestoreKeys.categories).get();
      final categoryDocs = categorySnapshot.docs;

      final categories =
      categoryDocs.map((e) => Category.fromJson(e.data())).toList();
      return categories;
    } catch (e) {
      print('error: $e');
      return [];
    }
  }
}