import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/book.dart';
import '../modals/synopsis_modal.dart';

class BookCardDetailsWidget extends StatelessWidget {
  const BookCardDetailsWidget({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return(
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child:
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${book.price}€',/* textAlign: TextAlign.left, */style: const TextStyle(fontSize: 30)),
                      IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          showSynopsis(context, book);
                          //showModalBottomSheet(context: context, builder: (context) => Text(book.synopsis.join("/n")));
                        },
                      ),
                    ]),
              ),
              Text(book.synopsis.join("/n"), /*textAlign: TextAlign.left, */style: const TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis, maxLines: 5),
            ],
          ),
        )
    );

  }
}