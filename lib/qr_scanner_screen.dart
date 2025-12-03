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
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR 코드 스캔'),
        actions: [
          // 토치(플래시) 버튼
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              // 5.x 버전 API: torchState 대신 isTorchOn 사용 (ValueListenable)
              valueListenable: cameraController.isTorchOn,
              builder: (context, isTorchOn, child) {
                return Icon(
                  isTorchOn ? Icons.flash_on : Icons.flash_off,
                  color: isTorchOn ? Colors.yellow : Colors.grey,
                );
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          // 카메라 전환 버튼
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              // 5.x 버전 API: cameraFacingState 사용 (ValueListenable)
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                  default:
                    return const Icon(Icons.camera_alt); // 기본값 처리
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TryOnScreen(qrData: code),
                ),
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
