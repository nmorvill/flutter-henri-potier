// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      type: $enumDecode(_$OfferTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      sliceValue: (json['sliceValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'type': _$OfferTypeEnumMap[instance.type]!,
      'value': instance.value,
      'sliceValue': instance.sliceValue,
    };

const _$OfferTypeEnumMap = {
  OfferType.percentage: 'percentage',
  OfferType.minus: 'minus',
  OfferType.slice: 'slice',
};
