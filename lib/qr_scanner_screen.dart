import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cosmetic_tryon_app/try_on_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController cameraController = MobileScannerController();
  bool _isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR 코드 스캔'),
        actions: [
          // 플래시 버튼
          IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.isTorchOn,
              builder: (context, isTorchOn, _) {
                return Icon(
                  isTorchOn ? Icons.flash_on : Icons.flash_off,
                  color: isTorchOn ? Colors.yellow : Colors.grey,
                );
              },
            ),
            onPressed: () async => await cameraController.toggleTorch(),
          ),

          // 카메라 전환 버튼
          IconButton(
            iconSize: 32,
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, _) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                  default:
                    return const Icon(Icons.camera_alt);
                }
              },
            ),
            onPressed: () async => await cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) async {
          if (_isScanned) return;

          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String? code = barcodes.first.rawValue;

            if (code != null) {
              setState(() => _isScanned = true);

              // 스캔 즉시 카메라 중지 (중복 호출 방지)
              await cameraController.stop();

              if (!mounted) return;

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
