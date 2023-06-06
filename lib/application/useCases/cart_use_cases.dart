import 'package:flutter/material.dart';
import 'package:flutter_app/domain/services/cart_service.dart';

import '../../domain/entities/book.dart';

class CartUseCases extends ChangeNotifier {

  final Map<Book, int> _cart = {};

  Map<Book, int> get cart => _cart;

  double getCartPrice() {
    return _cart.keys.map((x) => getCartLinePrice(x)).reduce((a,b) => a+b);
  }

  double getCartLinePrice(Book book){
    return CartService.getBookPrice(book, cart[book]!);
  }

  addToCart(Book book) {
    if(cart.containsKey(book)) {
      _cart[book] = _cart[book]! + 1;
    } else {
      _cart[book] = 1;
    }
    notifyListeners();
  }

  removeFromCart(Book book) {
    if(_cart.containsKey(book)) {
      if(_cart[book]! > 1) {
        _cart[book] = _cart[book]! - 1;
      } else {
        _cart.remove(book);
      }
      notifyListeners();
    }
  }

  int getNumberOfElementsInCart() {
    return _cart.length;
  }

}