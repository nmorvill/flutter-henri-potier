import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/offer.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel extends Offer{

  const OfferModel({
    required super.type,
    required super.value,
    super.sliceValue
  });

  Offer toOffer(){
    return Offer(type: type, value: value, sliceValue: sliceValue);
  }

  factory OfferModel.fromJson(Map<String,dynamic> json) => _$OfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferModelToJson(this);

}