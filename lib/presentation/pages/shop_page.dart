import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../application/useCases/cart_use_cases.dart';
import '../widgets/swiper_widget.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartUseCases>(
        builder: (context, cart, child) {
          return const Column(
              children: [
                SwiperWidget()
              ]
          );
        }
    );
  }
}