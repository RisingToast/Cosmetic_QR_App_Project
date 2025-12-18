import 'package:flutter/material.dart';
import 'package:cosmetic_tryon_app/cosmetic_data.dart';
import 'package:cosmetic_tryon_app/face_try_on_widget.dart';

class TryOnScreen extends StatelessWidget {
  final String? qrData;
  final CosmeticInfo? cosmeticInfo;

  // ✅ required 제거
  TryOnScreen({super.key, this.qrData})
      : cosmeticInfo = getCosmeticInfo(qrData!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('발색 테스트'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (qrData != null) ...[
              const Text(
                'QR 코드에서 읽어온 데이터:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                qrData!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],

            if (cosmeticInfo != null) ...[
              Text(
                '제품명: ${cosmeticInfo!.name}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '색상명: ${cosmeticInfo!.colorName}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: cosmeticInfo!.color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  '색상 미리보기',
                  style: TextStyle(
                    color: cosmeticInfo!.color.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                '얼굴 발색 테스트',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: FaceTryOnWidget(
                  color: cosmeticInfo!.color,
                ),
              ),
            ] else ...[
              const Spacer(),
              const Text(
                '화장품 정보를 찾을 수 없습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ],
        ),
      ),
    );
  }
}
