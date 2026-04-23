import 'package:flutter/material.dart';
import 'main.dart' show themeNotifier, AppColors;

class MyDetailPage extends StatefulWidget {
  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int _quantity = 1;
  bool _isFavorite = false;

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'California Roll',
      'price': 12.99,
      'image': 'assets/menu-2-yoshimasa-sushi.png',
      'description': 'Fresh crab, avocado, cucumber',
    },
    {
      'name': 'Rainbow Roll',
      'price': 16.99,
      'image': 'assets/menu-3-prato-sushi.png',
      'description': 'Assorted sashimi over California roll',
    },
    {
      'name': 'Spicy Tuna Roll',
      'price': 14.99,
      'image': 'assets/menu-1-yoshimasa-sushi.png',
      'description': 'Spicy tuna, tempura flakes, sriracha',
    },
  ];

  final List<Map<String, dynamic>> reviews = [
    {'name': 'Alex M.', 'rating': 5, 'comment': 'Best sushi in town! Fresh and delicious.', 'time': '2d ago'},
    {'name': 'Sarah K.', 'rating': 4, 'comment': 'Great ambiance and quick delivery.', 'time': '5d ago'},
    {'name': 'John D.', 'rating': 5, 'comment': 'Absolutely incredible quality rolls.', 'time': '1w ago'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  AppColors get c => themeNotifier.isDark ? AppColors.dark : AppColors.light;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: c.bg,
          body: Stack(
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _buildHeroHeader()),
                  SliverToBoxAdapter(child: _buildInfoSection()),
                  SliverToBoxAdapter(child: _buildQuantitySelector()),
                  SliverToBoxAdapter(child: _buildSectionTitle("More From This Restaurant")),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildMenuItem(menuItems[index]),
                      childCount: menuItems.length,
                    ),
                  ),
                  SliverToBoxAdapter(child: _buildSectionTitle("Reviews")),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildReviewCard(reviews[index]),
                      childCount: reviews.length,
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 120)),
                ],
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomOrderBar()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroHeader() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [c.accent, c.accentLight],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40, top: -40,
            child: Container(width: 160, height: 160,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.1))),
          ),
          Positioned(
            left: -30, bottom: 40,
            child: Container(width: 100, height: 100,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.06))),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircleButton(Icons.arrow_back_rounded, () => Navigator.pop(context)),
                      _buildCircleButton(
                        _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        () => setState(() => _isFavorite = !_isFavorite),
                        color: _isFavorite ? const Color(0xFFFF1744) : null,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Hero(
                      tag: 'food-Yoshimasa Sushi',
                      child: Image.asset('assets/menu-1-yoshimasa-sushi.png', fit: BoxFit.contain),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap, {Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44, height: 44,
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
        child: Center(child: Icon(icon, color: color ?? Colors.white, size: 22)),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yoshimasa Sushi",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: c.textPrimary, letterSpacing: -0.5)),
                    const SizedBox(height: 6),
                    Text("by Sushi Den Restaurant",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: c.textSecondary)),
                  ],
                ),
              ),
              Text("\$24.99",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: c.accent)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildStatChip(Icons.star_rounded, "4.9", const Color(0xFFFFB300)),
              const SizedBox(width: 12),
              _buildStatChip(Icons.local_fire_department_rounded, "250+ orders", c.accent),
              const SizedBox(width: 12),
              _buildStatChip(Icons.access_time_rounded, "25 min", const Color(0xFF00E676)),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Premium hand-crafted sushi made with the freshest imported fish. Our master chef uses traditional Japanese techniques combined with modern presentation.",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: c.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: ['🍣 Salmon', '🥑 Avocado', '🍚 Rice', '🫚 Ginger', '🥢 Nori']
                .map((e) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: c.surface, borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: c.border),
                      ),
                      child: Text(e, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: c.textPrimary)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: c.surface, borderRadius: BorderRadius.circular(20),
          border: Border.all(color: c.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Quantity", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: c.textPrimary)),
            Row(
              children: [
                _buildQtyButton(Icons.remove_rounded, () {
                  if (_quantity > 1) setState(() => _quantity--);
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('$_quantity',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: c.textPrimary)),
                ),
                _buildQtyButton(Icons.add_rounded, () => setState(() => _quantity++)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38, height: 38,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [c.accent, c.accentLight]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      child: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: c.textPrimary, letterSpacing: -0.3)),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: c.surface, borderRadius: BorderRadius.circular(18),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(item['image'], width: 70, height: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: c.textPrimary)),
                  const SizedBox(height: 4),
                  Text(item['description'], style: TextStyle(fontSize: 12, color: c.textSecondary, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Text('\$${item['price']}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: c.accent)),
                ],
              ),
            ),
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [c.accent, c.accentLight]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_rounded, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: c.surface, borderRadius: BorderRadius.circular(18),
          border: Border.all(color: c.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36, height: 36,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF7C4DFF), Color(0xFFB47CFF)]),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(review['name'][0],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review['name'], style: TextStyle(color: c.textPrimary, fontWeight: FontWeight.w700, fontSize: 13)),
                      Text(review['time'], style: TextStyle(color: c.textMuted, fontSize: 11, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    review['rating'],
                    (i) => const Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(review['comment'],
                style: TextStyle(color: c.textSecondary, fontSize: 13, fontWeight: FontWeight.w500, height: 1.4)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomOrderBar() {
    final total = (24.99 * _quantity).toStringAsFixed(2);
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        boxShadow: [
          BoxShadow(blurRadius: 24, color: Colors.black.withValues(alpha: themeNotifier.isDark ? 0.4 : 0.1), offset: const Offset(0, -8)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total", style: TextStyle(fontSize: 12, color: c.textSecondary, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text("\$$total", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: c.textPrimary)),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [c.accent, c.accentLight]),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(blurRadius: 16, color: c.accent.withValues(alpha: 0.4), offset: const Offset(0, 6)),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text("Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.3)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
