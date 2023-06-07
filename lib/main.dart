import 'package:flutter/material.dart';
import 'package:flutter_app/application/useCases/cart_use_cases.dart';
import 'package:flutter_app/presentation/pages/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartUseCases(),
      child: const MyApp()
    )  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'HenryPotier2'
      ),
      home: const ShopPage(),
    );
  }
}