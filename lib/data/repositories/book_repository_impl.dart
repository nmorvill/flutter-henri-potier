import 'package:flutter_app/data/const.dart';
import 'package:flutter_app/data/models/book_model.dart';
import 'package:flutter_app/data/models/offer_model.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/domain/entities/offer.dart';
import 'package:flutter_app/interfaces/repositories/book_repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BookRepositoryImpl extends BookRepository{

  @override
  Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse('$API_URL/books'));
    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body).map((x) => BookModel.fromJson(x).toBook()));
    } else {
      throw Exception("Failed to get books");
    }
  }

  @override
  Future<List<Offer>> getOffers(List<String> isbns) async {
    final response = await http.get(Uri.parse('$API_URL/books/${isbns.join(',')}/commercialOffers'));
    if (response.statusCode == 200) {
      return List.from(jsonDecode(response.body)['offers'].map((x) => OfferModel.fromJson(x).toOffer()));
    } else {
      throw Exception("Failed to get offers");
    }
  }

}