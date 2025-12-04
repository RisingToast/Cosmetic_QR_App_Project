import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 80, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            '마이 페이지',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('개인 설정 및 저장된 발색 기록이 표시됩니다.'),
        ],
      ),
    );
  }
}
