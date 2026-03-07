import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/app_route_path.dart';
import '../widgets/food_product_card.dart';
import '../widgets/custom_app_bar.dart';
import '../../data/allDummy_data.dart'; // assuming dummyProducts is here

final List<Map<String, String>> scrollableFoodTypes = [
  {"name": "Pizza", "image": "assets/Cake.png"},
  {"name": "Burger", "image": "assets/Dairy.png"},
  {"name": "Biryani", "image": "assets/Cake.png"},
  {"name": "Chinese", "image": "assets/Dairy.png"},
  {"name": "Rolls", "image": "assets/Cake.png"},
  {"name": "Desserts", "image": "assets/Dairy.png"},
];

final List<Map<String, dynamic>> dummyProducts = [
  {
    "imageUrl": "assets/Pizza.png",
    "title": "Margherita Pizza",
    "rating": 4.5,
    "price": 249.0,
    "originalPrice": 299.0,
  },
  {
    "imageUrl": "assets/Burger.png",
    "title": "Cheese Burger",
    "rating": 4.2,
    "price": 199.0,
    "originalPrice": 249.0,
  },
  {
    "imageUrl": "assets/Burger.png",
    "title": "White Sauce Pasta",
    "rating": 4.3,
    "price": 179.0,
    "originalPrice": 219.0,
  },
  {
    "imageUrl": "assets/Burger.png",
    "title": "Grilled Sandwich",
    "rating": 4.1,
    "price": 149.0,
    "originalPrice": 199.0,
  },
];

class FoodCategoryPage extends StatelessWidget {
  const FoodCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHomeAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Tappable Horizontal Product List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'WHAT\'S ON YOUR MIND?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.1,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 120, // To accommodate label + image layout
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: scrollableFoodTypes.length,
                  itemBuilder: (context, index) {
                    final item = scrollableFoodTypes[index];
                    return GestureDetector(
                      onTap: () {
                        // User requested to open corresponding product page on tap!
                        // This routes to the detailed Restaurant menu (e.g Domino's Pizza)
                        context.push(
                          AppRoutePath.restaurantDetails,
                          extra: item,
                        );
                      },
                      child: Container(
                        width: 85,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.black.withOpacity(0.4),
                              //     blurRadius: 10,
                              //     offset: const Offset(0, 4),
                              //   ),
                              // ],
                              clipBehavior: Clip.antiAlias,
                              child: item["image"] != null
                                  ? Image.asset(
                                      item["image"]!,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) => Icon(
                                            Icons.fastfood,
                                            color: Colors.orange.shade200,
                                            size: 40,
                                          ),
                                    )
                                  : Icon(
                                      Icons.fastfood,
                                      color: Colors.orange.shade200,
                                      size: 40,
                                    ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item["name"]!,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
              // Divider(thickness: 8, color: Colors.grey.shade100),
              // const SizedBox(height: 24),

              // Verticle Lists (Restaurants / Grids)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Top restaurant chains in Nagpur',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: dummyProducts.length,
                  itemBuilder: (context, index) {
                    final product = dummyProducts[index];

                    return GestureDetector(
                      onTap: () {
                        // Let grids navigate to the restaurant page too as an alternative route
                        context.push(
                          AppRoutePath.restaurantDetails,
                          extra: {
                            "name": product["title"],
                            "image": product["imageUrl"],
                          },
                        );
                      },
                      child: FoodProductCard(
                        image: product["imageUrl"],
                        title: product["title"],
                        rating: product["rating"],
                        price: product["price"],
                        originalPrice: product["originalPrice"],
                      ),
                    );
                  },
                ),
              ),

              // const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
