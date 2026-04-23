import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detailpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// ─── Theme notifier ───
class ThemeNotifier extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

final themeNotifier = ThemeNotifier();

// ─── App Colors ───
class AppColors {
  final Color bg;
  final Color surface;
  final Color cardBg;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color accent;
  final Color accentLight;
  final Color border;
  final Brightness brightness;

  const AppColors({
    required this.bg,
    required this.surface,
    required this.cardBg,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.accent,
    required this.accentLight,
    required this.border,
    required this.brightness,
  });

  static const dark = AppColors(
    bg: Color(0xFF0D0D0D),
    surface: Color(0xFF1A1A2E),
    cardBg: Color(0xFF1A1A2E),
    textPrimary: Colors.white,
    textSecondary: Color(0xFF9E9E9E),
    textMuted: Color(0xFF616161),
    accent: Color(0xFFFF6B35),
    accentLight: Color(0xFFFF8F65),
    border: Color(0x10FFFFFF),
    brightness: Brightness.dark,
  );

  static const light = AppColors(
    bg: Color(0xFFF7F7FA),
    surface: Colors.white,
    cardBg: Colors.white,
    textPrimary: Color(0xFF1A1A2E),
    textSecondary: Color(0xFF666680),
    textMuted: Color(0xFFAAAAAA),
    accent: Color(0xFFFF6B35),
    accentLight: Color(0xFFFF8F65),
    border: Color(0x12000000),
    brightness: Brightness.light,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        final isDark = themeNotifier.isDark;
        final colors = isDark ? AppColors.dark : AppColors.light;

        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ));

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Foodie',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            brightness: colors.brightness,
            scaffoldBackgroundColor: colors.bg,
            colorScheme: ColorScheme(
              brightness: colors.brightness,
              primary: colors.accent,
              onPrimary: Colors.white,
              secondary: const Color(0xFF00E676),
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: colors.surface,
              onSurface: colors.textPrimary,
            ),
          ),
          home: const MyHomePage(),
          routes: <String, WidgetBuilder>{
            '/detail-page': (BuildContext context) => MyDetailPage(),
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        final colors = themeNotifier.isDark ? AppColors.dark : AppColors.light;
        return Scaffold(
          backgroundColor: colors.bg,
          body: const MainPage(),
          bottomNavigationBar: _buildBottomBar(colors),
          extendBody: true,
        );
      },
    );
  }

  Widget _buildBottomBar(AppColors colors) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            color: Colors.black.withValues(alpha: themeNotifier.isDark ? 0.4 : 0.1),
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colors.surface,
          elevation: 0,
          items: [
            _navItem(Icons.home_rounded, "Home"),
            _navItem(Icons.explore_rounded, "Explore"),
            _navItem(Icons.shopping_bag_rounded, "Orders"),
            _navItem(Icons.person_rounded, "Profile"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: colors.accent,
          unselectedItemColor: colors.textMuted,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 4),
        child: Icon(icon, size: 24),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 4),
        child: Icon(icon, size: 26),
      ),
      label: label,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final List<String> categories = [
    '🍣 Sushi',
    '🍕 Pizza',
    '🍔 Burger',
    '🥗 Salad',
    '🍜 Noodles',
    '🧁 Dessert',
  ];
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> specials = [
    {
      'image': 'assets/menu-1-yoshimasa-sushi.png',
      'name': 'Yoshimasa Sushi',
      'price': '\$24.99',
      'time': '25 min',
      'rating': 4.9,
      'orders': '250+',
      'color': Color(0xFFFF6B35),
      'gradient': [Color(0xFFFF6B35), Color(0xFFFF8F65)],
    },
    {
      'image': 'assets/menu-2-yoshimasa-sushi.png',
      'name': 'Dragon Roll',
      'price': '\$18.99',
      'time': '20 min',
      'rating': 4.8,
      'orders': '180+',
      'color': Color(0xFF00E676),
      'gradient': [Color(0xFF00C853), Color(0xFF00E676)],
    },
    {
      'image': 'assets/menu-3-prato-sushi.png',
      'name': 'Prato Sushi',
      'price': '\$22.49',
      'time': '30 min',
      'rating': 4.7,
      'orders': '120+',
      'color': Color(0xFF7C4DFF),
      'gradient': [Color(0xFF651FFF), Color(0xFF7C4DFF)],
    },
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'image': 'assets/resturant-1-sushi-den.png',
      'name': 'Sushi Den',
      'cuisine': 'Japanese • Sushi Bar',
      'rating': 4.9,
      'distance': '1.2 km',
      'deliveryTime': '25-35 min',
      'deliveryFee': 'Free delivery',
    },
    {
      'image': 'assets/resturant-2-hatsuhana-shushi.png',
      'name': 'Hatsuhana Sushi',
      'cuisine': 'Japanese • Fine Dining',
      'rating': 4.8,
      'distance': '2.5 km',
      'deliveryTime': '30-40 min',
      'deliveryFee': '\$2.99',
    },
    {
      'image': 'assets/resturant-3-shushi-maki.png',
      'name': 'Sushi Maki',
      'cuisine': 'Japanese • Rolls',
      'rating': 4.7,
      'distance': '3.1 km',
      'deliveryTime': '35-45 min',
      'deliveryFee': '\$1.49',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  AppColors get c => themeNotifier.isDark ? AppColors.dark : AppColors.light;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return SafeArea(
          bottom: false,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: _buildHeader()),
                SliverToBoxAdapter(child: _buildSearchBar()),
                SliverToBoxAdapter(child: _buildCategories()),
                SliverToBoxAdapter(child: _buildSectionTitle("Today's Special", "🔥")),
                SliverToBoxAdapter(child: _buildSpecialCards()),
                SliverToBoxAdapter(child: _buildSectionTitle("Popular Near You", "📍")),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildRestaurantCard(restaurants[index]),
                    childCount: restaurants.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [c.accent, c.accentLight]),
              boxShadow: [
                BoxShadow(blurRadius: 12, color: c.accent.withValues(alpha: 0.4), offset: const Offset(0, 4)),
              ],
            ),
            child: const Center(
              child: Text("T", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good Evening 👋",
                    style: TextStyle(fontSize: 13, color: c.textSecondary, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text("Tushar Rai",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800, color: c.textPrimary, letterSpacing: -0.5)),
              ],
            ),
          ),
          // Dark/Light mode toggle
          GestureDetector(
            onTap: () {
              themeNotifier.toggle();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: c.border),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withValues(alpha: themeNotifier.isDark ? 0.2 : 0.06),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      RotationTransition(turns: animation, child: FadeTransition(opacity: animation, child: child)),
                  child: Icon(
                    themeNotifier.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    key: ValueKey(themeNotifier.isDark),
                    color: themeNotifier.isDark ? const Color(0xFFFFB300) : const Color(0xFF5C6BC0),
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Notification
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: c.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: c.border),
            ),
            child: Stack(
              children: [
                Center(child: Icon(Icons.notifications_outlined, color: c.textPrimary, size: 22)),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: c.accent, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: c.border),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withValues(alpha: themeNotifier.isDark ? 0.15 : 0.04),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 18),
            Icon(Icons.search_rounded, color: c.textMuted, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text("Search for food or restaurants...",
                  style: TextStyle(color: c.textMuted, fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [c.accent, c.accentLight]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.tune_rounded, color: Colors.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 44,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 24),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedCategory == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategory = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  gradient: isSelected ? LinearGradient(colors: [c.accent, c.accentLight]) : null,
                  color: isSelected ? null : c.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: isSelected ? null : Border.all(color: c.border),
                  boxShadow: isSelected
                      ? [BoxShadow(blurRadius: 10, color: c.accent.withValues(alpha: 0.3), offset: const Offset(0, 4))]
                      : null,
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? Colors.white : c.textSecondary,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String emoji) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 16),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: c.textPrimary, letterSpacing: -0.5)),
          const Spacer(),
          Text("See All", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: c.accent)),
        ],
      ),
    );
  }

  Widget _buildSpecialCards() {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 24, right: 8),
        itemCount: specials.length,
        itemBuilder: (context, index) {
          final item = specials[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/detail-page'),
            child: Container(
              width: 200,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: item['gradient'],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: (item['color'] as Color).withValues(alpha: 0.35),
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.1)),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    bottom: -30,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.06)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.access_time_rounded, color: Colors.white, size: 12),
                              const SizedBox(width: 4),
                              Text(item['time'],
                                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Center(
                            child: Hero(
                              tag: 'food-${item['name']}',
                              child: Image.asset(item['image'], fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(item['name'],
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['price'],
                                style:
                                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.white)),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star_rounded, color: Colors.white, size: 14),
                                  const SizedBox(width: 3),
                                  Text('${item['rating']}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRestaurantCard(Map<String, dynamic> restaurant) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/detail-page'),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: c.cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: c.border),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black.withValues(alpha: themeNotifier.isDark ? 0.15 : 0.04),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(blurRadius: 10, color: Colors.black.withValues(alpha: 0.2), offset: const Offset(0, 4)),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(restaurant['image'], fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant['name'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: c.textPrimary)),
                    const SizedBox(height: 4),
                    Text(restaurant['cuisine'],
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: c.textSecondary)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                              color: c.accent.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star_rounded, color: c.accent, size: 12),
                              const SizedBox(width: 2),
                              Text('${restaurant['rating']}',
                                  style: TextStyle(color: c.accent, fontSize: 11, fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on_outlined, size: 12, color: c.textMuted),
                            const SizedBox(width: 2),
                            Text(restaurant['distance'],
                                style: TextStyle(fontSize: 11, color: c.textMuted, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.access_time_rounded, size: 12, color: c.textMuted),
                            const SizedBox(width: 2),
                            Text(restaurant['deliveryTime'],
                                style: TextStyle(fontSize: 11, color: c.textMuted, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: restaurant['deliveryFee'] == 'Free delivery'
                      ? const Color(0xFF00E676).withValues(alpha: 0.15)
                      : c.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  restaurant['deliveryFee'] == 'Free delivery' ? 'FREE' : restaurant['deliveryFee'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: restaurant['deliveryFee'] == 'Free delivery' ? const Color(0xFF00E676) : c.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
