import 'package:flutter_app/domain/services/cart_service.dart';

import '../../domain/entities/book.dart';

class CartUseCases {

  Map<Book, int> cart = {};

  double getCartPrice() {
    return cart.keys.map((x) => getCartLinePrice(x)).reduce((a,b) => a+b);
  }

  double getCartLinePrice(Book book){
    return CartService.getBookPrice(book, cart[book]!);
  }

  addToCart(Book book) {
    if(cart.containsKey(book)) {
      cart[book] = cart[book]! + 1;
    } else {
      cart[book] = 1;
    }
  }

  removeFromCart(Book book) {
    if(cart.containsKey(book)) {
      if(cart[book]! > 1) {
        cart[book] = cart[book]! - 1;
      } else {
        cart.remove(book);
      }
    }
  }

  int getNumberOfElementsInCart() {
    return cart.length;
  }

}