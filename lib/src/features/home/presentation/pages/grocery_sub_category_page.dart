import 'package:flutter/material.dart';
import '../../data/allDummy_data.dart';
import '../widgets/grocery_product_card.dart';
import '../widgets/hot_deals_section.dart';
import '../widgets/fresh_items_section.dart';
import '../widgets/grocery_kitchen_section.dart';
import '../widgets/snacks_drinks_section.dart';
import '../widgets/beauty_wellness_section.dart';
import '../widgets/household_lifestyle_section.dart';
import '../widgets/banner_section.dart';

/// Swiggy-style sub-category page
/// Left column  → vertical list of sub-categories
/// Right column → product grid for the selected sub-category
class GrocerySubCategoryPage extends StatelessWidget {
  final GroceryTab tab;

  const GrocerySubCategoryPage({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    if (tab.name.toLowerCase() == 'all') {
      return RefreshIndicator(
        onRefresh: () async {
          // Add refresh logic here
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: HotDealsSection(),
              ),
            ),
            const FreshItemsSection(),
            const GroceryKitchenSection(),
            const SnacksDrinksSection(),
            const BeautyWellnessSection(),
            const HouseholdLifestyleSection(),
            const BannerSection(),
            const SliverToBoxAdapter(child: SizedBox(height: 52)),
          ],
        ),
      );
    }

    final slivers = <Widget>[];

    for (var subCat in tab.categories) {
      if (subCat.products.isEmpty) continue;

      // Category Header
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 16.0,
              bottom: 8.0,
              right: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subCat.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      );

      // Product Grid
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = subCat.products[index];
              return GroceryProductCard(
                image: product.imageAsset,
                title: product.name,
                rating: product.rating,
                price: product.price,
                originalPrice: product.originalPrice,
              );
            }, childCount: subCat.products.length),
          ),
        ),
      );
    }

    if (slivers.isEmpty) {
      return const Center(
        child: Text(
          'No products available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        // Add refresh logic here
        await Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: slivers,
      ),
    );
  }
}
