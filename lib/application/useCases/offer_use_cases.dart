import 'package:flutter_app/domain/services/calculator_service.dart';
import 'package:flutter_app/interfaces/repositories/book_repository.dart';

import '../useCases/cart_use_cases.dart';
import '../../domain/services/cart_service.dart';

class OfferUseCases{

  BookRepository repository;

  OfferUseCases(this.repository);

  Future<double> getBestOffer(CartUseCases cart) {
    return repository.getOffers(CartService.getIsbns(cart.cart.keys.toList()))
        .then((offers) => CalculatorService.computeBestOffer(cart.getCartPrice(), offers));
  }

}