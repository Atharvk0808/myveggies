import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_path.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/auth/presentation/pages/signup_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../features/cart/presentation/pages/cart_page.dart';
import '../features/home/presentation/pages/food_category_page.dart';
import '../features/home/presentation/pages/grocery_category_page.dart';
import '../features/home/presentation/pages/grocery_sub_category_page.dart';
import '../features/home/presentation/pages/hot_deals_page.dart';
import '../features/home/data/allDummy_data.dart'; // Needed for type and default value

class AppRouteConf {
  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutePath.login,
    routes: [
      GoRoute(
        path: AppRoutePath.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutePath.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutePath.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutePath.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutePath.cart,
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: AppRoutePath.foodCategory,
        builder: (context, state) => const FoodCategoryPage(),
      ),
      GoRoute(
        path: AppRoutePath.groceryCategory,
        builder: (context, state) => const GroceryCategoryPage(),
      ),
      GoRoute(
        path: AppRoutePath.grocerySubCategory,
        builder: (context, state) {
          final tab = state.extra as GroceryTab?;
          return Scaffold(
            appBar: AppBar(
              title: Text(tab?.name ?? 'Sub-Category'),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: GrocerySubCategoryPage(tab: tab ?? groceryTabs.first),
          );
        },
      ),
      GoRoute(
        path: AppRoutePath.hotDeals,
        builder: (context, state) => const HotDealsPage(),
      ),
    ],
  );
}
