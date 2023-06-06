import 'package:flutter_app/interfaces/repositories/book_repository.dart';

import '../../domain/entities/book.dart';

class LibraryUseCases {

  BookRepository repository;

  LibraryUseCases(this.repository);

  Future<List<Book>> getBooks() {
    return repository.getBooks();
  }

}