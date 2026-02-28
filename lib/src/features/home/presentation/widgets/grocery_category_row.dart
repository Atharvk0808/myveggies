import 'package:flutter/material.dart';
import '../../data/allDummy_data.dart';

class GroceryCategoryRow extends StatelessWidget {
  final List<GroceryTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabTap;

  const GroceryCategoryRow({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Horizontal scrollable tabs ─────────────
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                final tab = tabs[index];

                return GestureDetector(
                  onTap: () => onTabTap(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE8F5E9)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF4CAF50)
                            : Colors.grey.shade300,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Icon(
                            tab.icon,
                            color: isSelected
                                ? const Color(0xFF4CAF50)
                                : Colors.grey.shade700,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          tab.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFF2E7D32)
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ── Thin divider ────────────────────────────────
          Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        ],
      ),
    );
  }
}
