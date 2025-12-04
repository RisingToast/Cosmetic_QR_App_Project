import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            '홈 화면',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('주요 기능 및 추천 화장품 정보가 표시됩니다.'),
        ],
      ),
    );
  }
}
