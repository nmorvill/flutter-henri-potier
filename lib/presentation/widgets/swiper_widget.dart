import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../application/useCases/library_use_cases.dart';
import '../../data/repositories/book_repository_impl.dart';
import '../../domain/entities/book.dart';
import 'bookcard_widget.dart';

class SwiperWidget extends StatelessWidget{
  const SwiperWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      child: SizedBox(
          height:MediaQuery.of(context).size.height * 1,
          child : FutureBuilder<List<Book>>(
              future: LibraryUseCases(BookRepositoryImpl()).getBooks(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return AppinioSwiper(
                    loop: true,
                    cardsCount: snapshot.data!.length,
                    onSwiping: (direction) => {
                      //TODO: IMPLEMENTER
                      print(direction)
                    },
                    cardsBuilder: (BuildContext context, int index) {
                      return BookCardWidget(book: snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }
          )
      ),
    );
  }
}