import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/widgets/buttongroup_widget.dart';

import '../../application/useCases/library_use_cases.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../domain/entities/book.dart';
import 'bookcard_widget.dart';

class SwiperWidget extends StatelessWidget{

  AppinioSwiperController swiperController = AppinioSwiperController();

  SwiperWidget({super.key, required this.swiperController});



  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: Colors.green,
      child : Column (
        children: [
          SizedBox(
              height:MediaQuery.of(context).size.height * 0.9,
              child : FutureBuilder<List<Book>>(
                  future: LibraryUseCases(BookRepositoryImpl()).getBooks(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      return AppinioSwiper(
                        loop: true,
                        swipeOptions: AppinioSwipeOptions.horizontal,
                        cardsCount: snapshot.data!.length,
                        unlimitedUnswipe: true,
                        onSwiping: (direction) => {
                          //TODO: IMPLEMENTER
                          print(direction)
                        },
                        cardsBuilder: (BuildContext context, int index) {
                          return BookCardWidget(book: snapshot.data![index]);
                        },
                          controller: swiperController
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              swipeLeftButton(swiperController),
              swipeBackButton(context, swiperController),
              swipeRightButton(swiperController)
            ],
          )
        ],
      )
    );
  }
}