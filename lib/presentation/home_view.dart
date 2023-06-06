
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/application/useCases/library_use_cases.dart';
import 'package:flutter_app/data/repositories/book_repository_impl.dart';
import 'package:flutter_app/domain/entities/book.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<CartUseCases>(
      builder: (context, cart, child) {
        return Column(
          children: [
            SwipeCards()
          ]
        ); 
      }
    );
  }
}

class SwipeCards extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      child: SizedBox(
        height:MediaQuery.of(context).size.height * 0.75,
        child : FutureBuilder<List<Book>>(
          future: LibraryUseCases(BookRepositoryImpl()).getBooks(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return AppinioSwiper(
                cardsCount: snapshot.data!.length,
                onSwiping: (direction) => {
                  print(direction)
                },
                cardsBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(snapshot.data![index].title),
                  );
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
