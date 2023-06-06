import '../entities/book.dart';

class CartService {

  CartService();

  static double getBookPrice(Book book, int quantity) {
    return (book.price * quantity).toDouble();
  }

  static List<String> getIsbns(List<Book> books) {
    return books.map((b) => b.isbn).toList();
  }

}