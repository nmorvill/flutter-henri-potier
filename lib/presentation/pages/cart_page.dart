import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title:
          Row(
            children: [
              SizedBox(
                child:
                FloatingActionButton(
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
          //INSERT BODY HERE
          //body:

      ),
    );
  }
}