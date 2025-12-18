import 'package:flutter/material.dart';
import 'package:cosmetic_tryon_app/home_screen.dart';
import 'package:cosmetic_tryon_app/camera_screen.dart';
import 'package:cosmetic_tryon_app/cosmetic_info_screen.dart';
import 'package:cosmetic_tryon_app/my_page_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CameraScreen(),
    const CosmeticInfoScreen(),
    const MyPageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 1
          ? null
          : AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),

      body: _widgetOptions[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: '카메라'),
          BottomNavigationBarItem(icon: Icon(Icons.palette), label: '정보'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
        ],
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Cosmetic Try-On';
      case 2:
        return '화장품 정보';
      case 3:
        return '마이 페이지';
      default:
        return '';
    }
  }
}
