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
}

final List<CartItem> globalCart = [];

void addToCart(CartItem newItem) {
  // Check if item already exists
  for (var item in globalCart) {
    if (item.title == newItem.title) {
      item.quantity += newItem.quantity;
      return;
    }
  }
  globalCart.add(newItem);
}

void removeFromCart(CartItem item) {
  globalCart.remove(item);
}
