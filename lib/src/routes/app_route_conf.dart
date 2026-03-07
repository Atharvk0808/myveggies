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
import '../features/address/presentation/pages/address_list_page.dart';
import '../features/address/presentation/pages/map_location_page.dart';
import '../features/address/presentation/pages/location_details_page.dart';
import '../features/home/presentation/pages/restaurant_details_page.dart';
import '../features/home/data/allDummy_data.dart'; // Needed for type and default value
import '../core/widgets/page_loading_wrapper.dart'; // Implemented shimmer loading wrapper

class AppRouteConf {
  GoRouter get router => _router;

  final GoRouter _router = GoRouter(
    initialLocation: AppRoutePath.login,
    routes: [
      GoRoute(
        path: AppRoutePath.home,
        builder: (context, state) =>
            const PageLoadingWrapper(child: HomePage()),
      ),
      GoRoute(
        path: AppRoutePath.restaurantDetails,
        builder: (context, state) {
          final item = state.extra as Map<String, dynamic>?;
          return PageLoadingWrapper(child: RestaurantDetailsPage(item: item));
        },
      ),
      GoRoute(
        path: AppRoutePath.login,
        builder: (context, state) =>
            const LoginScreen(), // No shimmer needed for login
      ),
      GoRoute(
        path: AppRoutePath.signup,
        builder: (context, state) =>
            const SignupScreen(), // No shimmer needed for signup
      ),
      GoRoute(
        path: AppRoutePath.profile,
        builder: (context, state) =>
            const PageLoadingWrapper(child: ProfileScreen()),
      ),
      GoRoute(
        path: AppRoutePath.cart,
        builder: (context, state) =>
            const PageLoadingWrapper(child: CartPage()),
      ),
      GoRoute(
        path: AppRoutePath.foodCategory,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PageLoadingWrapper(child: FoodCategoryPage()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 500),
          );
        },
      ),
      GoRoute(
        path: AppRoutePath.groceryCategory,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PageLoadingWrapper(child: GroceryCategoryPage()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
            transitionDuration: const Duration(milliseconds: 500),
          );
        },
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
            body: PageLoadingWrapper(
              child: GrocerySubCategoryPage(tab: tab ?? groceryTabs.first),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutePath.hotDeals,
        builder: (context, state) =>
            const PageLoadingWrapper(child: HotDealsPage()),
      ),
      GoRoute(
        path: AppRoutePath.address,
        builder: (context, state) =>
            const PageLoadingWrapper(child: AddressListPage()),
      ),
      GoRoute(
        path: AppRoutePath.mapLocation,
        builder: (context, state) =>
            const PageLoadingWrapper(child: MapLocationPage()),
      ),
      GoRoute(
        path: AppRoutePath.locationDetails,
        builder: (context, state) =>
            const PageLoadingWrapper(child: LocationDetailsPage()),
      ),
    ],
  );
}
