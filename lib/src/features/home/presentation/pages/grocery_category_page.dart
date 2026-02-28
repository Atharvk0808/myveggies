import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/allDummy_data.dart';

import 'grocery_sub_category_page.dart';

class GroceryCategoryPage extends StatelessWidget {
  const GroceryCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: groceryTabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,

        // ── AppBar ──────────────────────────────────────────────
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          shadowColor: Colors.grey.shade300,

          // Left: back arrow
          leadingWidth: 40,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => context.pop(),
          ),

          title: Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFF4CAF50), size: 20),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Grocery & Vegetables',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Delivered in 10 minutes',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          actions: [
            IconButton(
              tooltip: 'Cart',
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
          ],

          // Swiggy-like TabBar at the bottom of the AppBar
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: const Color(0xFFFC8019), // Swiggy Orange
            indicatorWeight: 3,
            labelColor: const Color(0xFFFC8019),
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            tabs: groceryTabs.map((tab) {
              return Tab(
                iconMargin: const EdgeInsets.only(bottom: 6),
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Icon(tab.icon, size: 28),
                ),
                text: tab.name,
              );
            }).toList(),
          ),
        ),

        // ── Body ────────────────────────────────────────────────
        body: TabBarView(
          children: groceryTabs.map((tab) {
            return GrocerySubCategoryPage(tab: tab);
          }).toList(),
        ),
      ),
    );
  }
}
