import '../../domain/entities/book.dart';
import '../../domain/entities/offer.dart';

abstract class BookRepository{
  Future<List<Book>> getBooks();
  Future<List<Offer>> getOffers(List<String> isbns);
}