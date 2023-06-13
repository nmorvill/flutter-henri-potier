import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget(
      {super.key, required this.book, required this.borderRadius});

  final Book book;
  final int borderRadius;

  @override
  Widget build(BuildContext context) {
    return (Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius.toDouble()),
              child: Image.network(book.cover),
            ))));
  }
}
