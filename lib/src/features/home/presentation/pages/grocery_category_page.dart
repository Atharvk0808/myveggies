import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
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
        appBar: CustomHomeAppBar(
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: const Color(0xFFFC8019), // Swiggy Orange
            indicatorWeight: 1,
            labelColor: const Color(0xFFFC8019),
            unselectedLabelColor: Colors.grey.shade600,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
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
