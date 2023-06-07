import 'dart:io';

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
            Text(book.title.replaceAll('à', 'a').replaceAll('é', 'e').replaceAll(RegExp('ê'),'e'), textAlign: TextAlign.center, style: const TextStyle(fontSize: 35, fontFamily: 'HenryPotier2')),
            //La CustomFont que l'on utilise ne prends pas en compte les accents, on evite juste ici d'avoir des caractères "hors thèmes"
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${book.price}€', style: const TextStyle(fontSize: 30, fontFamily: 'HenryPotier2')),
                      IconButton(
                        icon: const Icon(Icons.info, size: 40),
                        onPressed: () {
                          showSynopsis(context, book);
                        },
                      ),
                    ]),
              ),
            ],
          ),
        )
    );

  }
}