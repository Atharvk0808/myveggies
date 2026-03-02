import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
              subtitle: 'Fresh & delicious meals delivered fast',
              assets: 'assets/fresh_food.jpg',
              onTap: () => context.push(AppRoutePath.foodCategory),
              gradientColors: [Colors.orange.shade100, Colors.white],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildCard(
              title: 'Grocery &\nVegetables',
              subtitle: 'Fresh produce to your door in minutes',
              assets: 'assets/grocery.jpg',
              onTap: () => context.push(AppRoutePath.groceryCategory),
              gradientColors: [Colors.green.shade100, Colors.white],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String assets,
    required VoidCallback onTap,
    required List<Color> gradientColors,
  }) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.black.withOpacity(0.05),
          highlightColor: Colors.black.withOpacity(0.02),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -10,
                bottom: -10,
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    assets,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().scale(
      delay: 100.ms,
      duration: 400.ms,
      curve: Curves.easeOutBack,
    );
  }
}
