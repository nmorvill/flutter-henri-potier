
import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

Future<void> playAd(BuildContext context, AppinioSwiperController controller){
  //open image ad.jpg from assets/images
  Image ad = Image.asset('assets/images/ad.jpg');
  //return Image.asset('images/ad.jpg');
  return Dialogs.materialDialog(
      color: Colors.white,
      title: 'ADS',
      customView: adImageWidget(),
      customViewPosition: CustomViewPosition.BEFORE_ACTION,
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            controller.unswipe();
            Navigator.pop(context);},
          text: 'Claim',
          iconData: Icons.done,
          color: Colors.blue,
          textStyle: const TextStyle(color: Colors.white),
          iconColor: Colors.white,
        ),
      ]);
}

Widget adImageWidget(){
  return const Image(image: AssetImage('assets/images/ad.jpg'));
}