import 'package:flutter/material.dart';
import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/data/repositories/book_repository_impl.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../interfaces/repositories/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  Database? database;

  CartRepositoryImpl() {
    _initDatabase();
  }

  void _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    database =
        await openDatabase(join(await getDatabasesPath(), 'cart_database.db'),
            onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE cart(isbn TEXT PRIMARY KEY, quantity INTEGER)',
      );
    }, version: 1);
  }

  @override
  Future<CartUseCases> getPersistedCart() async {
    var bookRepository = BookRepositoryImpl();
    var books = await bookRepository.getBooks();
    var cart = await getCart();
    var map = <Book, int>{};
    books.forEach((element) {
      var quantity = cart[element.isbn];
      if (quantity != null && quantity > 0) {
        map.putIfAbsent(element, () => quantity);
      }
    });
    return CartUseCases(map, updatePersistedCartQuantities);
  }

  @override
  void updatePersistedCartQuantities(Book book, int quantity) async {
    if (quantity == 1) {
      await database!.insert(
        'cart',
        book.toMap(quantity),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    if (quantity > 0) {
      await database!.update('cart', book.toMap(quantity),
          where: "isbn = ?", whereArgs: [book.isbn]);
    } else {
      await database!.delete('cart', where: "isbn = ?", whereArgs: [book.isbn]);
    }
    await getCart().then((e) => print(e));
  }

  Future<Map<String, int>> getCart() async {
    var cart = await database!.query('cart');
    return Map.fromIterable(cart,
        key: (element) => element["isbn"],
        value: (element) => element["quantity"]);
  }
}
