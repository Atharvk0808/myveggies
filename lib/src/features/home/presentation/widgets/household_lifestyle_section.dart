import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/allDummy_data.dart';
import '../pages/sub_category_details_page.dart';

class HouseholdLifestyleSection extends StatelessWidget {
  const HouseholdLifestyleSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Index 4 in our dummy data is 'Household & Lifestyle'
    final section = allTabSections[4];

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
        final dummyProducts = groceryTabs[4].categories[0].products.toList()
          ..shuffle();
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => SubCategoryDetailsPage(
              title: item.name,
              categories: [
                GroceryCategory(
                  name: 'Furnishing',
                  icon: Icons.king_bed,
                  products: dummyProducts.take(4).toList(),
                ),
                GroceryCategory(
                  name: 'Decor',
                  icon: Icons.emoji_objects,
                  products: dummyProducts.skip(1).take(4).toList(),
                ),
                GroceryCategory(
                  name: 'Cleaning',
                  icon: Icons.cleaning_services,
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
                        const Icon(Icons.chair, color: Colors.grey, size: 28),
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
