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
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.black, width: 3),
              image: const DecorationImage(
                image: AssetImage('assets/images/parchemin.jpg'),
                fit: BoxFit.cover,
              )
            ),
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

