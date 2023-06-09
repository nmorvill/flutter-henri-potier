import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/burningAnimation/burning_paper_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/useCases/cart_use_cases.dart';
import '../widgets/swiper_widget.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  AppinioSwiperController swiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: SwiperWidget(swiperController: swiperController))
      ]),
      Positioned(
          top: 0,
          right: 0,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CartUseCases>(builder: (context, cart, child) {
                return Badge(
                  label: Text(cart.getNumberOfElementsInCart().toString()),
                  isLabelVisible: cart.getNumberOfElementsInCart() > 0,
                  backgroundColor: Colors.blue,
                  child: FloatingActionButton(
                    onPressed: () {
                      context.go('/cart');
                    },
                    backgroundColor: const Color(0xFFF4F4F4),
                    child: const Icon(Icons.shopping_cart),
                  ),
                );
              }))),
      const IgnorePointer(
        child: BurningPaper(),
      )
    ]));
  }
}
