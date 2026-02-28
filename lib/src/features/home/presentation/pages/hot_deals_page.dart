import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/allDummy_data.dart';
import '../widgets/product_card.dart';

class HotDealsPage extends StatelessWidget {
  const HotDealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotDeals = hotDealsDummyData;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Hot Deals',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ), // Required share icon
            onPressed: () {},
          ),
        ],
      ),
      body: hotDeals.isEmpty
          ? const Center(child: Text("No Hot Deals currently available"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: hotDeals.length,
              itemBuilder: (context, index) {
                final product = hotDeals[index];
                return ProductCard(
                  image: product.imageAsset,
                  title: product.name,
                  rating: product.rating,
                  price: product.price,
                  originalPrice: product.originalPrice,
                );
              },
            ),
    );
  }
}
