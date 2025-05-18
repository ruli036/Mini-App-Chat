import 'package:flutter/cupertino.dart';

class WaveBackgroundPainter extends CustomPainter {
  final Color baseColor;
  final Color waveColor;
  final Color circleColor;

  WaveBackgroundPainter({
    required this.baseColor,
    required this.waveColor,
    required this.circleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintBase = Paint()..color = baseColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paintBase);

    // Gelombang besar bawah
    final wavePaint = Paint()..color = waveColor;
    final path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.6, size.width * 0.5, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, wavePaint);

    // Lingkaran dekorasi
    final circlePaint = Paint()..color = circleColor;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), 60, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.4), 40, circlePaint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.15), 30, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}