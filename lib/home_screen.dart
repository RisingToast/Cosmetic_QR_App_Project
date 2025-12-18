import 'package:flutter/material.dart';

/// ----------------------------
/// 모델
/// ----------------------------
class Product {
  final String id;
  final String name;
  final String brand;
  final String category;
  final String price;
  final Color color;
  final String personalColor;
  final bool saved;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    required this.color,
    required this.personalColor,
    this.saved = false,
  });

  Product copyWith({bool? saved}) {
    return Product(
      id: id,
      name: name,
      brand: brand,
      category: category,
      price: price,
      color: color,
      personalColor: personalColor,
      saved: saved ?? this.saved,
    );
  }
}

/// ----------------------------
/// 더미 데이터
/// ----------------------------
final featuredProducts = <Product>[
  Product(
    id: '1',
    name: '쥬시 래스팅 틴트',
    brand: '롬앤',
    category: 'lip',
    price: '8,900원',
    color: Color(0xFFE84C6B),
    personalColor: 'spring',
  ),
  Product(
    id: '2',
    name: '벨벳 틴트',
    brand: '페리페라',
    category: 'lip',
    price: '7,900원',
    color: Color(0xFFD43A56),
    personalColor: 'autumn',
  ),
  Product(
    id: '3',
    name: '워터 틴트',
    brand: '에뛰드',
    category: 'lip',
    price: '5,900원',
    color: Color(0xFFFF6B8A),
    personalColor: 'summer',
  ),
];

final popularProducts = [
  {
    'name': '쥬시 래스팅 틴트',
    'brand': '롬앤',
    'price': '8,900원',
    'count': '1,234명',
    'color': Color(0xFFE84C6B),
  },
  {
    'name': '벨벳 틴트',
    'brand': '페리페라',
    'price': '7,900원',
    'count': '987명',
    'color': Color(0xFFD43A56),
  },
];

final recommendedColors = [
  {'name': '코랄 핑크', 'tag': '봄 웜톤', 'color': Color(0xFFF27289)},
  {'name': '로즈 베이지', 'tag': '가을 웜톤', 'color': Color(0xFFC55A71)},
];

/// ----------------------------
/// 홈 스크린
/// ----------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Product? selectedProduct;
  final Set<String> savedProducts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            _QuickActions(),
            _SectionTitle(title: '화장품 정보'),
            _FeaturedGrid(
              products: featuredProducts,
              onTap: (product) {
                setState(() {
                  selectedProduct = product;
                });
              },
            ),
            _SectionTitle(title: '인기 순위'),
            _PopularList(),
            _SectionTitle(title: '추천 컬러'),
            _RecommendedGrid(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// ----------------------------
/// 위젯들
/// ----------------------------
class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEC4899), Color(0xFF9333EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'COSMETIC TRY-ON',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '나에게 어울리는 화장품 컬러를 찾아보세요',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.05),
              ),
            ],
          ),
          child: Row(
            children: [
              _QuickButton(
                icon: Icons.auto_awesome,
                label: '가상 메이크업',
                color: Colors.pink,
              ),
              const SizedBox(width: 12),
              _QuickButton(
                icon: Icons.qr_code_scanner,
                label: 'QR 스캔',
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickButton({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text('더보기', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _FeaturedGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onTap;

  const _FeaturedGrid({required this.products, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final p = products[index];
          return GestureDetector(
            onTap: () => onTap(p),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(blurRadius: 6, color: Color(0x11000000)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: p.color,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(p.brand, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(p.name, maxLines: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(p.price, style: const TextStyle(color: Colors.pink)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final p = popularProducts[index];
          return Container(
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: p['color'] as Color,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(p['brand'] as String, style: const TextStyle(fontSize: 12)),
                      Text(p['name'] as String),
                      Text(p['price'] as String, style: const TextStyle(color: Colors.pink)),
                      Text(p['count'] as String, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: popularProducts.length,
      ),
    );
  }
}

class _RecommendedGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recommendedColors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, index) {
          final c = recommendedColors[index];
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: c['color'] as Color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                Text(c['name'] as String),
                Text(
                  c['tag'] as String,
                  style: const TextStyle(fontSize: 12, color: Colors.pink),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
