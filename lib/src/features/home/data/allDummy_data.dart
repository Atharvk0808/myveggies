import 'package:flutter/material.dart';

//  Dummy data – Grocery categories & products

class GroceryProduct {
  final String name;
  final String imageAsset;
  final double price;
  final double originalPrice;
  final String unit;
  final double rating;

  const GroceryProduct({
    required this.name,
    required this.imageAsset,
    required this.price,
    required this.originalPrice,
    required this.unit,
    this.rating = 4.2,
  });
}

class GroceryCategory {
  final String name;
  final IconData icon; // used as fallback icon label
  final List<GroceryProduct> products;

  const GroceryCategory({
    required this.name,
    required this.icon,
    required this.products,
  });
}

class GroceryTab {
  final String name;
  final IconData icon;
  // final String emoji;
  final List<GroceryCategory> categories;

  const GroceryTab({
    required this.name,
    required this.icon,
    // required this.emoji,
    required this.categories,
  });
}

class AllSectionData {
  final String title;
  final List<AllSectionItem> items;
  const AllSectionData({required this.title, required this.items});
}

class AllSectionItem {
  final String name;
  final String image;
  const AllSectionItem({required this.name, required this.image});
}

// ── Products pool ──────────────────────────────

const _freshFruits = [
  GroceryProduct(
    name: 'Bananas',
    imageAsset: 'assets/grocery.jpg',
    price: 49,
    originalPrice: 65,
    unit: '6 pcs',
  ),
  GroceryProduct(
    name: 'Red Apples',
    imageAsset: 'assets/grocery.jpg',
    price: 120,
    originalPrice: 155,
    unit: '4 pcs',
  ),
  GroceryProduct(
    name: 'Mango',
    imageAsset: 'assets/grocery.jpg',
    price: 99,
    originalPrice: 130,
    unit: '500 g',
  ),
];

const _freshVeg = [
  GroceryProduct(
    name: 'Fresh Tomatoes',
    imageAsset: 'assets/grocery.jpg',
    price: 40,
    originalPrice: 55,
    unit: '500 g',
  ),
  GroceryProduct(
    name: 'Green Capsicum',
    imageAsset: 'assets/Paratha.png',
    price: 35,
    originalPrice: 50,
    unit: '250 g',
  ),
  GroceryProduct(
    name: 'Broccoli',
    imageAsset: 'assets/grocery.jpg',
    price: 60,
    originalPrice: 80,
    unit: '500 g',
  ),
];

const _elecGadgets = [
  GroceryProduct(
    name: 'Wireless Earbuds',
    imageAsset: 'assets/grocery.jpg',
    price: 1499,
    originalPrice: 2000,
    unit: '1 pair',
  ),
  GroceryProduct(
    name: 'Smartwatch V2',
    imageAsset: 'assets/grocery.jpg',
    price: 2999,
    originalPrice: 3500,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Power Bank 10000mAh',
    imageAsset: 'assets/grocery.jpg',
    price: 999,
    originalPrice: 1299,
    unit: '1 pc',
  ),
];

const _elecAccessories = [
  GroceryProduct(
    name: 'Type-C Cable',
    imageAsset: 'assets/grocery.jpg',
    price: 299,
    originalPrice: 399,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Wall Charger 20W',
    imageAsset: 'assets/grocery.jpg',
    price: 499,
    originalPrice: 699,
    unit: '1 pc',
  ),
];

const _fashionApparel = [
  GroceryProduct(
    name: 'Cotton T-Shirt',
    imageAsset: 'assets/grocery.jpg',
    price: 399,
    originalPrice: 599,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Denim Jeans',
    imageAsset: 'assets/grocery.jpg',
    price: 999,
    originalPrice: 1499,
    unit: '1 pc',
  ),
];

const _fashionFootwear = [
  GroceryProduct(
    name: 'Running Shoes',
    imageAsset: 'assets/grocery.jpg',
    price: 1499,
    originalPrice: 2499,
    unit: '1 pair',
  ),
  GroceryProduct(
    name: 'Casual Loafers',
    imageAsset: 'assets/grocery.jpg',
    price: 899,
    originalPrice: 1299,
    unit: '1 pair',
  ),
];

const _homeDecor = [
  GroceryProduct(
    name: 'Ceramic Vase',
    imageAsset: 'assets/grocery.jpg',
    price: 450,
    originalPrice: 600,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Wall Clock',
    imageAsset: 'assets/grocery.jpg',
    price: 799,
    originalPrice: 999,
    unit: '1 pc',
  ),
];

const _homeFurnishing = [
  GroceryProduct(
    name: 'Cotton Bedsheet',
    imageAsset: 'assets/grocery.jpg',
    price: 899,
    originalPrice: 1199,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Plush Towel Set',
    imageAsset: 'assets/grocery.jpg',
    price: 599,
    originalPrice: 899,
    unit: '3 pcs',
  ),
];

const _beautyMakeup = [
  GroceryProduct(
    name: 'Matte Lipstick',
    imageAsset: 'assets/grocery.jpg',
    price: 299,
    originalPrice: 450,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Liquid Eyeliner',
    imageAsset: 'assets/grocery.jpg',
    price: 199,
    originalPrice: 250,
    unit: '1 pc',
  ),
];

const _beautySkincare = [
  GroceryProduct(
    name: 'Vitamin C Serum',
    imageAsset: 'assets/grocery.jpg',
    price: 599,
    originalPrice: 799,
    unit: '30 ml',
  ),
  GroceryProduct(
    name: 'Hydrating Face Cream',
    imageAsset: 'assets/grocery.jpg',
    price: 399,
    originalPrice: 499,
    unit: '50 g',
  ),
];

const _kidsToys = [
  GroceryProduct(
    name: 'Building Blocks',
    imageAsset: 'assets/grocery.jpg',
    price: 499,
    originalPrice: 699,
    unit: '1 set',
  ),
  GroceryProduct(
    name: 'Remote Control Car',
    imageAsset: 'assets/grocery.jpg',
    price: 899,
    originalPrice: 1199,
    unit: '1 pc',
  ),
];

const _kidsBabyCare = [
  GroceryProduct(
    name: 'Baby Diapers M',
    imageAsset: 'assets/grocery.jpg',
    price: 699,
    originalPrice: 850,
    unit: '40 pcs',
  ),
  GroceryProduct(
    name: 'Baby Wipes',
    imageAsset: 'assets/grocery.jpg',
    price: 199,
    originalPrice: 250,
    unit: '80 pcs',
  ),
];

const _weddingGifts = [
  GroceryProduct(
    name: 'Silver Coin 10g',
    imageAsset: 'assets/grocery.jpg',
    price: 950,
    originalPrice: 1100,
    unit: '1 pc',
  ),
  GroceryProduct(
    name: 'Perfume Gift Set',
    imageAsset: 'assets/grocery.jpg',
    price: 1299,
    originalPrice: 1899,
    unit: '1 set',
  ),
];

const _weddingEssentials = [
  GroceryProduct(
    name: 'Rose Garland',
    imageAsset: 'assets/grocery.jpg',
    price: 250,
    originalPrice: 300,
    unit: '2 pcs',
  ),
  GroceryProduct(
    name: 'Decorative Thali',
    imageAsset: 'assets/grocery.jpg',
    price: 499,
    originalPrice: 699,
    unit: '1 pc',
  ),
];

// ──  Tab list ───────────────────────

final List<GroceryTab> groceryTabs = [
  GroceryTab(
    name: 'All',
    icon: Icons.apps,
    categories: [
      GroceryCategory(
        name: 'All Items',
        icon: Icons.list,
        products: [
          ..._freshFruits,
          ..._freshVeg,
          ..._elecGadgets,
          ..._elecAccessories,
          ..._fashionApparel,
          ..._fashionFootwear,
          ..._homeDecor,
          ..._homeFurnishing,
          ..._beautyMakeup,
          ..._beautySkincare,
          ..._kidsToys,
          ..._kidsBabyCare,
          ..._weddingGifts,
          ..._weddingEssentials,
        ],
      ),
    ],
  ),
  GroceryTab(
    name: 'Fresh',
    icon: Icons.eco,
    categories: [
      GroceryCategory(
        name: 'Fresh Fruits',
        icon: Icons.apple,
        products: _freshFruits,
      ),
      GroceryCategory(
        name: 'Fresh Vegetables',
        icon: Icons.grass,
        products: _freshVeg,
      ),
    ],
  ),
  GroceryTab(
    name: 'Electronics',
    icon: Icons.devices,
    categories: [
      GroceryCategory(
        name: 'Gadgets',
        icon: Icons.headphones,
        products: _elecGadgets,
      ),
      GroceryCategory(
        name: 'Accessories',
        icon: Icons.cable,
        products: _elecAccessories,
      ),
    ],
  ),
  GroceryTab(
    name: 'Fashion',
    icon: Icons.checkroom,
    categories: [
      GroceryCategory(
        name: 'Apparel',
        icon: Icons.shopping_bag,
        products: _fashionApparel,
      ),
      GroceryCategory(
        name: 'Footwear',
        icon: Icons.snowshoeing,
        products: _fashionFootwear,
      ),
    ],
  ),
  GroceryTab(
    name: 'Home',
    icon: Icons.home,
    categories: [
      GroceryCategory(
        name: 'Decor',
        icon: Icons.emoji_objects,
        products: _homeDecor,
      ),
      GroceryCategory(
        name: 'Furnishing',
        icon: Icons.king_bed,
        products: _homeFurnishing,
      ),
    ],
  ),
  GroceryTab(
    name: 'Beauty',
    icon: Icons.face_retouching_natural,
    categories: [
      GroceryCategory(
        name: 'Makeup',
        icon: Icons.brush,
        products: _beautyMakeup,
      ),
      GroceryCategory(
        name: 'Skincare',
        icon: Icons.spa,
        products: _beautySkincare,
      ),
    ],
  ),
  GroceryTab(
    name: 'Kids',
    icon: Icons.child_care,
    categories: [
      GroceryCategory(name: 'Toys', icon: Icons.smart_toy, products: _kidsToys),
      GroceryCategory(
        name: 'Baby Care',
        icon: Icons.baby_changing_station,
        products: _kidsBabyCare,
      ),
    ],
  ),
  GroceryTab(
    name: 'Wedding',
    icon: Icons.celebration,
    categories: [
      GroceryCategory(
        name: 'Gifts',
        icon: Icons.card_giftcard,
        products: _weddingGifts,
      ),
      GroceryCategory(
        name: 'Essentials',
        icon: Icons.favorite,
        products: _weddingEssentials,
      ),
    ],
  ),
];

// ── All Tab Data ────────────────────────────────

const List<AllSectionData> allTabSections = [
  AllSectionData(
    title: 'Fresh items',
    items: [
      AllSectionItem(
        name: 'Fresh Vegetables',
        image: 'assets/Fresh_vegetables.png',
      ),
      AllSectionItem(name: 'Fresh Fruits', image: 'assets/Biryani.png'),
      AllSectionItem(name: 'Dairy, Bread and Eggs', image: 'assets/dairy.png'),
      AllSectionItem(name: 'Meat and Seafood', image: 'assets/Meat.png'),
    ],
  ),
  AllSectionData(
    title: 'Grocery & Kitchen',
    items: [
      AllSectionItem(name: 'Atta, Rice and Dal', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Masalas', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Oils and Ghee', image: 'assets/grocery.jpg'),
      AllSectionItem(
        name: 'Cereals and Breakfast',
        image: 'assets/grocery.jpg',
      ),
    ],
  ),
  AllSectionData(
    title: 'Snacks & drinks',
    items: [
      AllSectionItem(
        name: 'Cold Drinks and Juices',
        image: 'assets/grocery.jpg',
      ),
      AllSectionItem(
        name: 'Ice Creams and Frozen Desserts',
        image: 'assets/grocery.jpg',
      ),
      AllSectionItem(name: 'Chips and Namkeens', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Chocolates', image: 'assets/grocery.jpg'),
      AllSectionItem(
        name: 'Noodles, Pasta, Vermicelli',
        image: 'assets/grocery.jpg',
      ),
      AllSectionItem(name: 'Frozen Food', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Sweet Corner', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Paan Corner', image: 'assets/grocery.jpg'),
    ],
  ),
  AllSectionData(
    title: 'Beauty & Wellness',
    items: [
      AllSectionItem(name: 'Bath and Body', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Hair Care', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Skincare', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Makeup', image: 'assets/grocery.jpg'),
    ],
  ),
  AllSectionData(
    title: 'Household & Lifestyle',
    items: [
      AllSectionItem(name: 'Home and Furnishing', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Kitchen and Dining', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Cleaning Essentials', image: 'assets/grocery.jpg'),
      AllSectionItem(name: 'Clothing', image: 'assets/grocery.jpg'),
    ],
  ),
];

// ── Hot Deals list ───────────────────────

const List<GroceryProduct> hotDealsDummyData = [
  GroceryProduct(
    name: 'Fresh Tomatoes',
    imageAsset: 'assets/Burger.png',
    price: 35,
    originalPrice: 55,
    unit: '500 g',
  ),
  GroceryProduct(
    name: 'Basmati Rice',
    imageAsset: 'assets/grocery.jpg',
    price: 185,
    originalPrice: 240,
    unit: '2 kg',
  ),
  GroceryProduct(
    name: 'Mango',
    imageAsset: 'assets/Pizza.png',
    price: 89,
    originalPrice: 130,
    unit: '500 g',
  ),
  GroceryProduct(
    name: 'Ghee',
    imageAsset: 'assets/bakery.png',
    price: 135,
    originalPrice: 185,
    unit: '500 ml',
  ),
  GroceryProduct(
    name: 'Sunscreen SPF 50',
    imageAsset: 'assets/grocery.jpg',
    price: 250,
    originalPrice: 350,
    unit: '50 ml',
  ),
  GroceryProduct(
    name: 'Croissant',
    imageAsset: 'assets/grocery.jpg',
    price: 30,
    originalPrice: 45,
    unit: '2 pcs',
  ),
  GroceryProduct(
    name: 'Lays Classic',
    imageAsset: 'assets/Burger.png',
    price: 15,
    originalPrice: 20,
    unit: '26 g',
  ),
  GroceryProduct(
    name: 'Cheese Slices',
    imageAsset: 'assets/Dairy.png',
    price: 99,
    originalPrice: 120,
    unit: '200 g',
  ),
  GroceryProduct(
    name: 'Green Tea',
    imageAsset: 'assets/grocery.jpg',
    price: 120,
    originalPrice: 149,
    unit: '25 bags',
  ),
  GroceryProduct(
    name: 'Face Wash',
    imageAsset: 'assets/grocery.jpg',
    price: 149,
    originalPrice: 180,
    unit: '100 ml',
  ),
  GroceryProduct(
    name: 'Dark Chocolate',
    imageAsset: 'assets/Pizza.png',
    price: 99,
    originalPrice: 125,
    unit: '80 g',
  ),
  GroceryProduct(
    name: 'Floor Cleaner',
    imageAsset: 'assets/grocery.jpg',
    price: 99,
    originalPrice: 120,
    unit: '1 L',
  ),
];
