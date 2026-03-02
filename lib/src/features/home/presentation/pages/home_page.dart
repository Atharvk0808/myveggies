import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../routes/app_route_path.dart';
import '../widgets/category_cards.dart';
import '../widgets/section1_mind.dart';
import '../widgets/section2_groceries.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Color(0xFFFC8019),
              size: 28,
            ), // Swiggy Orange
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                  const Text(
                    'Pune, Maharashtra',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push(AppRoutePath.profile),
              child: CircleAvatar(
                backgroundColor: Colors.purple[100],
                child: const Icon(Icons.person, color: Colors.purple),
              ),
            ),
          ),
        ],
      ),
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
                      const SizedBox(height: 16),

                      // Search Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search vegetables, fruits...',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFFC8019),
                              ),
                              suffixIcon: Icon(
                                Icons.mic_none,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

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
