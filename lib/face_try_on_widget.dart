import 'package:flutter/material.dart';

class FaceTryOnWidget extends StatelessWidget {
  final Color color;

  const FaceTryOnWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    // 실제 발색 테스트는 복잡한 이미지 처리(예: AR/ML)가 필요하지만,
    // 기초 버전에서는 얼굴 이미지 위에 색상을 오버레이하는 방식으로 시뮬레이션합니다.
    // 실제 얼굴 이미지를 사용할 수 없으므로, 플레이스홀더를 사용합니다.
    
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1. 얼굴 이미지 플레이스홀더 (실제 앱에서는 카메라 피드 또는 이미지)
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Center(
            child: Text(
              '얼굴 이미지 영역\n(실제 앱에서는 카메라/이미지)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
        ),

        // 2. 발색 시뮬레이션 오버레이 (입술 또는 볼 영역)
        // 이 위젯은 실제 얼굴의 특정 영역(예: 입술)에 색상을 오버레이하는 것을 시뮬레이션합니다.
        // 여기서는 간단한 원형 오버레이로 대체합니다.
        Positioned(
          top: 50,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: color.withOpacity(0.7), // 색상과 투명도 적용
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Center(
              child: Text(
                '발색 시뮬레이션',
                style: TextStyle(
                  color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        
        // 3. 사용자가 QR 코드에 없는 데이터를 입력했을 때의 처리
        if (color == Colors.red) // 예시: 특정 색상일 때 경고 표시
          Positioned(
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '경고: 이 색상은 매우 강렬합니다!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
