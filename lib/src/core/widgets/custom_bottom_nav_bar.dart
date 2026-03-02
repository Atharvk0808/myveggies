import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../routes/app_route_path.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFFC8019), // Swiggy Orange
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        onTap: (index) {
          if (index == currentIndex) return;

          switch (index) {
            case 0:
              context.go(AppRoutePath.home);
              break;
            case 1:
              context.go(AppRoutePath.cart);
              break;
            case 2:
              context.go(AppRoutePath.profile);
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home)
                .animate()
                .scale(duration: 300.ms, curve: Curves.easeOutBack)
                .tint(color: const Color(0xFFFC8019)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            activeIcon: const Icon(Icons.shopping_cart)
                .animate()
                .scale(duration: 300.ms, curve: Curves.easeOutBack)
                .tint(color: const Color(0xFFFC8019)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person)
                .animate()
                .scale(duration: 300.ms, curve: Curves.easeOutBack)
                .tint(color: const Color(0xFFFC8019)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
