import 'package:flutter/material.dart';

class CosmeticInfo {
  final String id;
  final String name;
  final String colorName;
  final Color color;

  CosmeticInfo({
    required this.id,
    required this.name,
    required this.colorName,
    required this.color,
  });
}

// Dummy data source: Maps QR code string (product ID) to CosmeticInfo
final Map<String, CosmeticInfo> dummyCosmeticData = {
  'PROD_001': CosmeticInfo(
    id: 'PROD_001',
    name: '벨벳 립 틴트',
    colorName: '코랄 핑크',
    color: const Color(0xFFFF69B4), // Hot Pink
  ),
  'PROD_002': CosmeticInfo(
    id: 'PROD_002',
    name: '매트 립스틱',
    colorName: '클래식 레드',
    color: const Color(0xFFB22222), // Firebrick
  ),
  'PROD_003': CosmeticInfo(
    id: 'PROD_003',
    name: '글로우 블러셔',
    colorName: '피치 오렌지',
    color: const Color(0xFFFFDAB9), // Peach Puff
  ),
};

// Function to get cosmetic info from QR data
CosmeticInfo? getCosmeticInfo(String qrData) {
  // 실제 앱에서는 API 호출 또는 데이터베이스 조회가 필요합니다.
  // 이 기초 버전에서는 QR 데이터가 제품 ID라고 가정합니다.
  return dummyCosmeticData[qrData];
}
