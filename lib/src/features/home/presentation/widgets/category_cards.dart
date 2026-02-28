import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/app_route_path.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildCard(
              title: 'Food',
              subtitle: 'Fresh, quality items delivered to your door',
              // imagePlaceholderColor: Colors.orange,
              assets: 'assets/fresh_food.jpg',
              onTap: () => context.push(AppRoutePath.foodCategory),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildCard(
              title: 'Grocery &\nVegetables',
              subtitle: 'Fresh, quality items delivered to your door',
              // imagePlaceholderColor: Colors.green,
              assets: 'assets/grocery.jpg',
              onTap: () => context.push(AppRoutePath.groceryCategory),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    // required Color imagePlaceholderColor,
    required assets,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                    // color: imagePlaceholderColor.withValues(alpha: 0.2),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    assets,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      // color: imagePlaceholderColor.withValues(alpha: 0.2),
                      // child: Icon(Icons.fastfood, color: imagePlaceholderColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
