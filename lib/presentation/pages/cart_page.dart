import 'package:flutter/material.dart';
import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/application/useCases/offer_use_cases.dart';
import 'package:flutter_app/data/repositories/book_repository_impl.dart';
import 'package:flutter_app/presentation/widgets/bookcart_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                child: FloatingActionButton(
                  onPressed: () => context.go('/'),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(
                //width : MediaQuery.of(context).size.width ,
                child: Text('Cart Page', textAlign: TextAlign.center),
              ),
              const SizedBox(
                  //vide
                  )
            ],
          ),
        ),
        body: Consumer<CartUseCases>(builder: (context, cart, child) {
          return ListView(scrollDirection: Axis.vertical, children: [
            ...cart
                .getBooksInCart()
                .map((b) => Column(children: [
                      SizedBox(height: 95, child: BookCartWidget(book: b)),
                      const SizedBox(height: 15)
                    ]))
                .toList(),
            Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Total", style: TextStyle(fontSize: 25)),
                Text("${cart.getCartPrice()}€",
                    style: const TextStyle(fontSize: 25))
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Reduction", style: TextStyle(fontSize: 25)),
                FutureBuilder(
                    future:
                        OfferUseCases(BookRepositoryImpl()).getBestOffer(cart),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text("- ${snapshot.data!}€",
                            style: const TextStyle(fontSize: 25));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    })
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Final price", style: TextStyle(fontSize: 25)),
                FutureBuilder(
                    future:
                        OfferUseCases(BookRepositoryImpl()).getBestOffer(cart),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text("${cart.getCartPrice() - snapshot.data!}€",
                            style: const TextStyle(fontSize: 25));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    })
              ]),
            ])
          ]);
        }));
  }
}
