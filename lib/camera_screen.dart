import 'package:flutter/material.dart';
import 'package:cosmetic_tryon_app/qr_scanner_screen.dart';
import 'package:cosmetic_tryon_app/try_on_screen.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),

            /// 로고 영역
            Column(
              children: const [
                Text(
                  'Color진',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B6B),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '카메라로 Color 제품을 경험해보세요',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// 중앙 카메라 아이콘
            Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: Color(0xFFFF6B6B),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 48,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '카메라 기능 선택',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '원하시는 기능을 선택해주세요',
              style: TextStyle(fontSize: 12, color: Colors.black45),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _FeatureCard(
                    icon: Icons.qr_code_scanner,
                    iconBgColor: const Color(0xFFE0ECFF),
                    iconColor: const Color(0xFF4D7CFE),
                    title: '바코드 스캔',
                    description: '제품의 바코드를 스캔하여 컬러 정보를 확인해보세요',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const QRScannerScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _FeatureCard(
                    icon: Icons.auto_awesome,
                    iconBgColor: const Color(0xFFFFE1EA),
                    iconColor: const Color(0xFFFF5C8A),
                    title: '가상 메이크업',
                    description: '얼굴 인식으로 화장품 컬러를 체험해보세요',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TryOnScreen(qrData: null),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ----------------------------
/// 기능 카드
/// ----------------------------
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFFC1C1)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
