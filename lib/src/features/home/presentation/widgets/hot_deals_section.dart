import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/allDummy_data.dart';
import '../../../../routes/app_route_path.dart';
import 'product_card.dart';

class HotDealsSection extends StatelessWidget {
  const HotDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hotDeals = hotDealsDummyData.take(5).toList();

    if (hotDeals.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hot Deals',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  context.push(AppRoutePath.hotDeals);
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height:
              250, // Fixed height allows the ProductCard expanded layout to know its bounds
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: hotDeals.length,
            itemBuilder: (context, index) {
              final product = hotDeals[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ProductCard(
                  image: product.imageAsset,
                  title: product.name,
                  rating: product.rating,
                  price: product.price,
                  originalPrice: product.originalPrice,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
