import 'package:flutter/material.dart';
import "library.dart";

class CartWrapper extends StatefulWidget {
  final Widget child;

  const CartWrapper({super.key, required this.child});

  
  static CartWrapperState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Cart>())!.data;
  }

  @override
  CartWrapperState createState() => CartWrapperState();

}

class CartWrapperState extends State<CartWrapper> {
  List<Book> cart = List.empty(growable: true);

  void addToCart(Book book) {
    setState(() {
      cart.add(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Cart(cart: cart, data: this, child: widget.child);
  }
}

class Cart extends InheritedWidget {
  
  const Cart({
    super.key,
    required super.child,
    required this.cart,
    required this.data,
  });

  final List<Book> cart;
  final CartWrapperState data;

  static Cart? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Cart>();
  }

  static Cart of(BuildContext context) {
    final Cart? result = maybeOf(context);
    return result!;
  }
  
  @override
  bool updateShouldNotify(Cart oldWidget) {
    return cart.length != oldWidget.cart.length;
  }
}

class CartIconWidget extends StatefulWidget {
  
  const CartIconWidget({super.key});

  @override
  State<CartIconWidget> createState() => _CartIcon();

}

class _CartIcon extends State<CartIconWidget> {

  @override
  Widget build(BuildContext context) {
    List<Widget> cartIcon = [const Icon(Icons.shopping_cart)];
    var cart = CartWrapper.of(context);
    if(cart.cart.isNotEmpty) {
      cartIcon.add(Container(
              alignment: Alignment.center,
              height: 12,
              width:12,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(cart.cart.length.toString(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
            ));
    }
    
    return IconButton(
      icon: Stack(
          children: cartIcon
        ),
      onPressed: () => {print(cart.cart)},
    );
  }
}