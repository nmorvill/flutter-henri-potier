import 'dart:math';

import '../entities/offer.dart';

class CalculatorService{

  CalculatorService();

  static double computeBestOffer(double price, List<Offer> offers){
    return offers.map((o) => _getOffer(price, o)).reduce(max);
  }

  static double _getOffer(double price, Offer offer) {
    switch(offer.type) {
      case OfferType.percentage : return _calculatePercentage(price, offer);
      case OfferType.minus : return _calculateMinus(price, offer);
      case OfferType.slice : {
        try {
          return _calculateSlice(price, offer);
        } catch (e){
          print("Error : $e");
          return 0;
        }
      }
    }
  }

  static double _calculatePercentage(double price, Offer offer) => price * offer.value / 100;

  static double _calculateMinus(double price, Offer offer) => offer.value;

  static double _calculateSlice(double price, Offer offer){
    if(offer.sliceValue == null) throw Exception("Slice value is expected");
    int cptSlice = (price / offer.sliceValue!).floor();
    return cptSlice * offer.value;
  }

}