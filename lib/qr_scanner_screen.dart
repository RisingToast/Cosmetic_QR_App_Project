import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cosmetic_tryon_app/try_on_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    // MainNavigationScreen의 body로 사용되므로 Scaffold와 AppBar를 제거하고 MobileScanner만 반환합니다.
    return MobileScanner(
      // MobileScanner 위젯은 컨트롤러를 사용하여 카메라 피드를 표시합니다.
      controller: cameraController,
      onDetect: (capture) {
        if (_isScanned) return;

        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isNotEmpty) {
          final String? code = barcodes.first.rawValue;
          if (code != null) {
            setState(() {
              _isScanned = true;
            });

            // 스캔 성공 시 다음 화면으로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TryOnScreen(qrData: code),
              ),
            ).then((_) {
              // TryOnScreen에서 돌아왔을 때 스캔 상태를 초기화하여 재스캔 가능하게 함
              if (mounted) {
                setState(() {
                  _isScanned = false;
                });
              }
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
