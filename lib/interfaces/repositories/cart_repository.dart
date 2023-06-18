import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/domain/entities/book.dart';

abstract class CartRepository {
  Future<CartUseCases> getPersistedCart();

  void updatePersistedCartQuantities(Book book, int quantity);
}
