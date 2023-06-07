import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';
import 'bookcarddetails_widget.dart';
import 'bookimage_widget.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return(
        //create a container with the image of the book
        Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child:
            Padding(
                padding: const EdgeInsets.all(10),
                child:
                Column(
                  children: [
                    BookImageWidget(book: book),
                    BookCardDetailsWidget(book: book)
                  ],
                )
            )
        )
    );
  }
}

