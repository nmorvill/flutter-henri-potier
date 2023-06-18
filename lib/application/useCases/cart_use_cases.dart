import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/domain/services/cart_service.dart';

class CartUseCases extends ChangeNotifier {
  final Map<Book, int> _cart;
  final Function(Book, int) _updatePersistedCart;

  CartUseCases(this._cart, this._updatePersistedCart);

  Map<Book, int> get cart => _cart;

  double getCartPrice() {
    return _cart.isNotEmpty
        ? _cart.keys.map((x) => getCartLinePrice(x)).reduce((a, b) => a + b)
        : 0.0;
  }

  double getCartLinePrice(Book book) {
    return _cart.containsKey(book)
        ? CartService.getBookPrice(book, cart[book]!)
        : 0.0;
  }

  addToCart(Book book) {
    if (cart.containsKey(book)) {
      _cart[book] = _cart[book]! + 1;
    } else {
      _cart[book] = 1;
    }
    _updatePersistedCart(book, _cart[book]!);
    notifyListeners();
  }

  removeFromCart(Book book) {
    if (_cart.containsKey(book)) {
      if (_cart[book]! > 1) {
        _cart[book] = _cart[book]! - 1;
        _updatePersistedCart(book, _cart[book]!);
      } else {
        _cart.remove(book);
        _updatePersistedCart(book, 0);
      }
      notifyListeners();
    }
  }

  int getNumberOfElementsInCart() {
    return _cart.isNotEmpty ? _cart.values.reduce((a, b) => a + b) : 0;
  }

  List<Book> getBooksInCart() {
    return _cart.keys.toList();
  }

  int getNumberOfBookInCart(Book book) {
    return _cart.containsKey(book) ? _cart[book]! : 0;
  }
}
