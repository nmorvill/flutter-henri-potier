// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      isbn: json['isbn'] as String,
      price: json['price'] as int,
      cover: json['cover'] as String,
      title: json['title'] as String,
      synopsis:
          (json['synopsis'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'price': instance.price,
      'cover': instance.cover,
      'title': instance.title,
      'synopsis': instance.synopsis,
    };
