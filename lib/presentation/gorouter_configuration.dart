import 'package:flutter_app/presentation/pages/cart_page.dart';
import 'package:flutter_app/presentation/pages/shop_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ShopPage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartPage(),
    ),
  ],
);