import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/cart_repository_impl.dart';
import 'package:flutter_app/presentation/gorouter_configuration.dart';
import 'package:provider/provider.dart';

void main() {
  var cartRepo = CartRepositoryImpl();
  cartRepo.getPersistedCart().then((persistedCart) => {
        runApp(ChangeNotifierProvider(
            create: (context) => persistedCart, child: const MyApp()))
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'HenryPotier2'),
    );
  }
}
