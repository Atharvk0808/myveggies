import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/allDummy_data.dart';
import '../pages/sub_category_details_page.dart';

class SnacksDrinksSection extends StatelessWidget {
  const SnacksDrinksSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Index 2 in our dummy data is 'Snacks & drinks'
    final section = allTabSections[2];

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 24,
              bottom: 16,
            ),
            child: Text(
              section.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.65,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
            ),
            itemCount: section.items.length,
            itemBuilder: (context, index) {
              final item = section.items[index];
              return _buildCard(context, item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, AllSectionItem item) {
    return GestureDetector(
      onTap: () {
        final dummyProducts = groceryTabs[0].categories[0].products.toList()
          ..shuffle();
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => SubCategoryDetailsPage(
              title: item.name,
              categories: [
                GroceryCategory(
                  name: 'Chips',
                  icon: Icons.fastfood,
                  products: dummyProducts.take(4).toList(),
                ),
                GroceryCategory(
                  name: 'Juices',
                  icon: Icons.local_drink,
                  products: dummyProducts.skip(2).take(4).toList(),
                ),
                GroceryCategory(
                  name: 'Cold Drinks',
                  icon: Icons.sports_bar,
                  products: dummyProducts.take(3).toList(),
                ),
              ],
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F6FB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.cookie, color: Colors.grey, size: 28),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
