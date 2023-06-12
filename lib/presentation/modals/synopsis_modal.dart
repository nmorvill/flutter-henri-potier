import 'package:flutter/cupertino.dart';

import '../../domain/entities/book.dart';

Future<void> showSynopsis(BuildContext context, Book book) async {
  return showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        title: Text(book.title, style: const TextStyle(fontSize: 30 ,fontFamily: 'HenryPotier')),
        message: Text(book.synopsis.join("/n"), style: const TextStyle(fontSize: 20 ,fontFamily: 'HenryPotier')),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text("Adava Kadabra", style: const TextStyle(fontSize: 25 ,fontFamily: 'HenryPotier')),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}