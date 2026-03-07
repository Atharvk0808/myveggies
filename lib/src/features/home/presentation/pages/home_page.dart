import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/category_cards.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section1_mind.dart';
import '../widgets/section2_groceries.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          // Add refresh logic here
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(), // Swiggy-like smooth iOS scroll on all platforms
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                [
                      // Category Cards
                      const CategoryCards(),

                      const SizedBox(height: 22),

                      // Section 1: What's on your mind?
                      const Section1Mind(),

                      const SizedBox(height: 22),

                      // Horizontal Line Divider
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(color: Colors.grey[200], thickness: 4),
                      ),

                      const SizedBox(height: 22),

                      // Section 2: Groceries delivered in minutes
                      const Section2Groceries(),

                      const SizedBox(height: 22),
                    ]
                    .animate(interval: 50.ms)
                    .fade(duration: 400.ms)
                    .slideY(begin: 0.1, end: 0, curve: Curves.easeOutQuad),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
