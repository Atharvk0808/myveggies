import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';
import '../../data/cart_data.dart';
import 'coupon_page.dart';
import '../../../../core/widgets/page_loading_wrapper.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey _billDetailsKey = GlobalKey();

  void _updateCart() {
    setState(() {});
    saveCartToStorage();
  }

  Widget _buildCouponsCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PageLoadingWrapper(child: CouponPage()),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.local_offer,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Apply Coupon',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashCount = (constraints.constrainWidth() / 6).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return const SizedBox(
                width: 3,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black26),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildBillRow(
    String title,
    String value, {
    String? oldPrice,
    bool dottedUnderline = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: dottedUnderline
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade400,
                      style: BorderStyle.none,
                    ),
                  ),
                )
              : null,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              decoration: dottedUnderline
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: Colors.grey.shade500,
            ),
          ),
        ),
        Row(
          children: [
            if (oldPrice != null) ...[
              Text(
                oldPrice,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black54,
                ),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBillDetailsCard(double totalAmount) {
    double originalTotal = totalAmount + 26.0; // Dummy original total
    double handlingFeeOld = 11.0;
    double handlingFeeNew = 5.0;
    double deliveryTip = 10.0;
    double deliveryFee = 30.0;
    double gst = 6.30;

    double toPay =
        totalAmount + handlingFeeNew + deliveryTip + deliveryFee + gst;
    double originalToPay =
        originalTotal + handlingFeeOld + deliveryTip + deliveryFee + gst;

    return Container(
      key: _billDetailsKey,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BILL DETAILS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.black54,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          _buildBillRow(
            'Item Total',
            '₹${totalAmount.toStringAsFixed(2)}',
            oldPrice: '₹${originalTotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 12),
          _buildBillRow(
            'Handling Fee',
            '₹${handlingFeeNew.toStringAsFixed(2)}',
            oldPrice: '₹${handlingFeeOld.toStringAsFixed(2)}',
            dottedUnderline: true,
          ),
          _buildDottedDivider(),
          _buildBillRow(
            'Delivery Partner Tip',
            '₹${deliveryTip.toStringAsFixed(2)}',
          ),
          _buildDottedDivider(),
          _buildBillRow(
            'Delivery Partner Fee',
            '₹${deliveryFee.toStringAsFixed(2)}',
            dottedUnderline: true,
          ),
          const SizedBox(height: 4),
          const Text(
            'Add items worth ₹44 to avail your Free Delivery on this order',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),
          _buildBillRow(
            'GST and Charges',
            '₹${gst.toStringAsFixed(2)}',
            dottedUnderline: true,
          ),
          _buildDottedDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'To Pay',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  Text(
                    '₹${originalToPay.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '₹${toPay.toInt()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNoteCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: 'NOTE: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                TextSpan(
                  text:
                      'Orders cannot be cancelled and are non-refundable once packed for delivery.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Read cancellation policy',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 13,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCheckoutBar(double totalAmount) {
    double toPay = totalAmount + 30.0 + 10.0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${toPay.toInt()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                GestureDetector(
                  onTap: () {
                    if (_billDetailsKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        _billDetailsKey.currentContext!,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOutCubic,
                        alignment: 0.5,
                      );
                    }
                  },
                  child: const Text(
                    'View Detailed Bill >',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Add Address to Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (var item in globalCart) {
      totalAmount += (item.price * item.quantity);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Your Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: globalCart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.local_grocery_store_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Add items to start building your cart.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Add refresh logic here
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          '10 Mins',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade50,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            border: Border.all(
                                              color: Colors.green.shade200,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.bolt,
                                                color: Colors.green.shade700,
                                                size: 12,
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                'Superfast',
                                                style: TextStyle(
                                                  color: Colors.green.shade700,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${globalCart.length} item${globalCart.length > 1 ? 's' : ''}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                _buildDottedDivider(),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: globalCart.length,
                                  itemBuilder: (context, index) {
                                    final item = globalCart[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              item.image,
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                              errorBuilder: (_, __, ___) =>
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    color: Colors.grey.shade200,
                                                    child: const Icon(
                                                      Icons.fastfood,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                const Text(
                                                  '165 g',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.bookmark_border,
                                                      size: 14,
                                                      color: Colors.black54,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'Move to wishlist',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationStyle:
                                                            TextDecorationStyle
                                                                .dashed,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 2,
                                                    ),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (item.quantity > 1) {
                                                          item.quantity--;
                                                        } else {
                                                          removeFromCart(item);
                                                        }
                                                        _updateCart();
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 6,
                                                            ),
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 16,
                                                          color:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${item.quantity}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blueAccent,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        item.quantity++;
                                                        _updateCart();
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 6,
                                                            ),
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 16,
                                                          color:
                                                              Colors.blueAccent,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '₹${((item.price * item.quantity) + 26).toInt()}', // Mocked original price match +26
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    '₹${(item.price * item.quantity).toInt()}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton.icon(
                                  onPressed: () {
                                    final router = GoRouter.of(context);
                                    if (router.canPop()) {
                                      router.pop();
                                      router.push('/grocery-category');
                                    } else {
                                      router.pushReplacement(
                                        '/grocery-category',
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: Colors.black54,
                                  ),
                                  label: const Text(
                                    'Add more items',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildCouponsCard(context),
                          const SizedBox(height: 16),
                          _buildBillDetailsCard(totalAmount),
                          const SizedBox(height: 16),
                          _buildNoteCard(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildBottomCheckoutBar(totalAmount),
              ],
            ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
