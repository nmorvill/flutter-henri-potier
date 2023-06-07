import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../application/useCases/cart_use_cases.dart';
import '../widgets/swiper_widget.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<StatefulWidget> createState() => _shopPageState();

}


class _shopPageState extends State<ShopPage> {

  AppinioSwiperController swiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartUseCases>(
        builder: (context, cart, child) {
          return   Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: SwiperWidget(swiperController: swiperController )
                )
              ]
          );
        }
    );
  }
}