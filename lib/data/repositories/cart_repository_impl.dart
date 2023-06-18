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
    initDatabase();
  }

  void initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    database =
        await openDatabase(join(await getDatabasesPath(), 'doggie_database.db'),
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
    return CartUseCases(map);
  }

  @override
  void addToPersistedCart(Book book) {
    // TODO: implement addToPersistedCart
  }

  void _openDatabase() async {}

  Future<Map<String, int>> getCart() async {
    initDatabase();
    var cart = await database!.query('cart');
    return Map.fromIterable(cart,
        key: (element) => element["isbn"],
        value: (element) => element["quantity"]);
  }
}
