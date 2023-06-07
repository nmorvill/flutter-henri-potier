import 'package:flutter_app/domain/entities/offer.dart';
import 'package:flutter_app/domain/services/calculator_service.dart';
import 'package:test/test.dart';


void main(){
  group('Calculator Service testing', (){

    test('CalculatorService should be able to calculate percentage offer', (){
      List<Offer> offer = [const Offer(type:OfferType.percentage, value: 10)];
      final double result = CalculatorService.computeBestOffer(350, offer);
      expect(result, 35);
    });

    test('CalculatorService should be able to calculate a minius offer',(){
      List<Offer> offer = [const Offer(type:OfferType.minus, value: 10)];
      final double result = CalculatorService.computeBestOffer(350, offer);
      expect(result, 10);
    });

    test('CalculatorService should return 0 if no slice value is given for slice offer',(){
      List<Offer> offer = [const Offer(type:OfferType.slice, value: 10)];
      final double result = CalculatorService.computeBestOffer(350, offer);
      expect(result, 0);
    });

    test('CalculatorService should be able to calculate a slice offer',(){
      List<Offer> offer = [const Offer(type:OfferType.slice, value: 10, sliceValue: 100)];
      final double result = CalculatorService.computeBestOffer(350, offer);
      expect(result, 30);
    });

    test('CalculatorService should be able to calculate the best offer',(){
      List<Offer> offers = [
        const Offer(type:OfferType.percentage, value: 10),
        const Offer(type:OfferType.minus, value: 10),
        const Offer(type:OfferType.slice, value: 10, sliceValue: 100)
      ];

      final double result = CalculatorService.computeBestOffer(350, offers);
      expect(result, 35.0);
    });

  });
}