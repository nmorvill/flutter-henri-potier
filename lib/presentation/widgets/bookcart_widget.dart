import 'package:flutter/material.dart';
import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:flutter_app/presentation/widgets/bookimage_widget.dart';
import 'package:provider/provider.dart';

class BookCartWidget extends StatelessWidget {
  const BookCartWidget({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartUseCases>(builder: (context, cart, child) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              (Container(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 3, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(book.cover),
                      )))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: const TextStyle(fontSize: 18)),
                    Text("${cart.getCartLinePrice(book)}€",
                        style: const TextStyle(fontSize: 16))
                  ]),
            ]),
            Row(children: [
              Column(children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () => cart.addToCart(book),
                  child: const Icon(Icons.arrow_drop_up),
                )),
                Expanded(
                    child: Center(
                        child: (Text(
                            cart.getNumberOfBookInCart(book).toString())))),
                Expanded(
                    child: (ElevatedButton(
                  onPressed: () => cart.removeFromCart(book),
                  child: const Icon(Icons.arrow_drop_down),
                )))
              ])
            ])
          ]);
    });
  }
}
