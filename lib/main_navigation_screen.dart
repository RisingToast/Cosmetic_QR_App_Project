import 'package:flutter/material.dart';
import 'package:cosmetic_tryon_app/home_screen.dart';
import 'package:cosmetic_tryon_app/qr_scanner_screen.dart';
import 'package:cosmetic_tryon_app/cosmetic_info_screen.dart';
import 'package:cosmetic_tryon_app/my_page_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // 4개의 페이지 리스트
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),          // 0: 홈 화면
    const QRScannerScreen(),      // 1: 카메라 화면 (QR 스캐너)
    const CosmeticInfoScreen(),   // 2: 화장품 정보 화면
    const MyPageScreen(),         // 3: 마이 페이지 화면
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 현재 선택된 화면에 따라 AppBar의 제목을 변경합니다.
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // 선택된 인덱스에 해당하는 화면을 표시합니다.
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // 하단 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: '스캔',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette),
            label: '정보',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor, // 테마 색상 사용
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // 4개 이상일 때 아이템이 움직이지 않도록 고정
      ),
    );
  }

  // AppBar 제목을 결정하는 헬퍼 함수
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Cosmetic Try-On (홈)';
      case 1:
        return 'QR 코드 스캔 (카메라)';
      case 2:
        return '화장품 정보';
      case 3:
        return '마이 페이지';
      default:
        return 'Cosmetic Try-On';
    }
  }
}
