import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/book.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends Book {
  const BookModel(
      {required super.isbn,
      required super.price,
      required super.cover,
      required super.title,
      required super.synopsis});

  Book toBook() {
    return Book(
        isbn: isbn,
        price: price,
        cover: cover,
        title: title,
        synopsis: synopsis);
  }

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
