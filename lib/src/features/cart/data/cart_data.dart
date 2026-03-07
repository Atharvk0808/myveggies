import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartItem {
  final String image;
  final String title;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
    'image': image,
    'title': title,
    'price': price,
    'quantity': quantity,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      image: json['image'],
      title: json['title'],
      price: json['price'].toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }
}

final List<CartItem> globalCart = [];
const _storage = FlutterSecureStorage();
const _cartKey = 'secure_cart_data';

Future<void> saveCartToStorage() async {
  final String jsonString = jsonEncode(
    globalCart.map((e) => e.toJson()).toList(),
  );
  await _storage.write(key: _cartKey, value: jsonString);
}

Future<void> loadCartFromStorage() async {
  final String? jsonString = await _storage.read(key: _cartKey);
  if (jsonString != null) {
    try {
      final List<dynamic> decoded = jsonDecode(jsonString);
      globalCart.clear();
      for (var item in decoded) {
        globalCart.add(CartItem.fromJson(item));
      }
    } catch (e) {
      // Failed to load cart
    }
  }
}

Future<void> addToCart(CartItem newItem) async {
  // Check if item already exists
  for (var item in globalCart) {
    if (item.title == newItem.title) {
      item.quantity += newItem.quantity;
      await saveCartToStorage();
      return;
    }
  }
  globalCart.add(newItem);
  await saveCartToStorage();
}

Future<void> removeFromCart(CartItem item) async {
  globalCart.remove(item);
  await saveCartToStorage();
}
