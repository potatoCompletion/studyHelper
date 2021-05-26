import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey[300] // 선 색상 설정
      ..strokeWidth = 3;  // 선 굵기 설정

    Offset start = Offset(0, size.height / 100);
    Offset end = Offset(size.width, size.height / 100);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}