import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/app_route_path.dart';
import '../../../../core/widgets/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => context.pop(),
        // ),
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= USER HEADER =================
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/profile.png',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Atharv Katkar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'AtharvK08@gmail.com',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+91 98765 43210',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= WALLET CARD =================
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Wallet Balance",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "₹ 250",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Get 5% cashback",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= QUICK ACTIONS =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickAction(
                    Icons.shopping_bag_outlined,
                    "Orders",
                    Colors.purple,
                    Colors.purple.withValues(alpha: 0.1),
                  ),
                  _buildQuickAction(
                    Icons.favorite_border,
                    "Wishlist",
                    Colors.red,
                    Colors.red.withValues(alpha: 0.1),
                  ),
                  _buildQuickAction(
                    Icons.location_on_outlined,
                    "Address",
                    Colors.blue,
                    Colors.blue.withValues(alpha: 0.1),
                  ),
                  _buildQuickAction(
                    Icons.card_giftcard,
                    "Offers",
                    Colors.orange,
                    Colors.orange.withValues(alpha: 0.1),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ================= ACCOUNT SETTINGS =================
            _sectionTitle(Icons.settings_outlined, "Account Settings"),

            _buildSettingsTile(
              icon: Icons.person_outline,
              title: 'Profile Information',
              subtitle: 'Manage your personal info',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              subtitle: 'Choose what you get notified',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.credit_card,
              title: 'Payment Methods',
              subtitle: 'UPI, Cards, Wallet',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.lock_outline,
              title: 'Privacy & Security',
              subtitle: 'Manage your data',
            ),
            _divider(),

            const SizedBox(height: 20),

            // ================= SUPPORT =================
            _sectionTitle(Icons.headset_mic_outlined, "Support"),

            _buildSettingsTile(
              icon: Icons.help_outline,
              title: 'Help Center',
              subtitle: 'FAQs and support',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.chat_bubble_outline,
              title: 'Live Chat',
              subtitle: '24/7 customer support',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.rate_review_outlined,
              title: 'Rate Us',
              subtitle: 'Share your feedback',
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Sign out from this device',
              isDestructive: true,
              onTap: () => context.go(AppRoutePath.login),
            ),
            _divider(),
            _buildSettingsTile(
              icon: Icons.delete_outline,
              title: 'Delete Account',
              subtitle: 'Permanently remove account',
              isDestructive: true,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }

  // ================= WIDGETS =================

  static Widget _buildQuickAction(
    IconData icon,
    String label,
    Color iconColor,
    Color bgColor,
  ) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Icon(icon, color: iconColor, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  static Widget _sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDestructive
              ? Colors.red.withValues(alpha: 0.1)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: isDestructive ? Colors.red : Colors.grey[600]),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDestructive ? Colors.red : Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }

  static Widget _divider() {
    return Divider(
      height: 1,
      indent: 70,
      endIndent: 20,
      color: Colors.grey[200],
    );
  }
}
