import 'package:flutter/material.dart';

class CosmeticInfoScreen extends StatelessWidget {
  const CosmeticInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.palette, size: 80, color: Colors.pink),
          SizedBox(height: 16),
          Text(
            '화장품 정보 화면',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('화장품 상세 정보 및 리뷰가 표시됩니다.'),
        ],
      ),
    );
  }
}
