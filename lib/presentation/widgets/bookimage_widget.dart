import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return(
        Container(
          alignment: Alignment.center,
          child:
            Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20, 10),
              child:
                Image.network(book.cover )
            )
        )
    );
  }
}