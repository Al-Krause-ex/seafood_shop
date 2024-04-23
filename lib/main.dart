import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:seafood_shop/core/constants/constants.dart';
import 'package:seafood_shop/firebase_options.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/seafood_shop_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final db = FirebaseFirestore.instance;

  await Hive.initFlutter();

  Hive.registerAdapter(BasketAdapter());
  Hive.registerAdapter(BasketItemAdapter());

  final basketBox = await Hive.openBox<Basket>(HiveBoxKey.basketBox);

  runApp(SeafoodShop(db: db, basketBox: basketBox));
}
