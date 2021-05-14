import 'dart:math';

import 'package:flutter/material.dart';

class DashedCircle extends StatelessWidget {
  final double radius, dashes, gap;
  final Color color;
  DashedCircle({this.color, this.radius, this.dashes, this.gap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      child: CustomPaint(
        painter: DashedCirclePainter(
            dashes: dashes, gap: gap, radius: radius / 2, color: color),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final double radius, dashes, gap;
  final Color color;
  DashedCirclePainter({this.radius, this.dashes, this.gap, this.color});
  num radians(num deg) => deg * (pi / 180.0);
  @override
  void paint(Canvas canvas, Size size) {
    double length = (2 * pi * 168.75 / 225) / (dashes + (dashes * gap) - gap);
    final center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < dashes; i++) {
      Paint paint = Paint()
        ..color = color
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          (radians(-90.0 + 225) + (i * ((gap + 1) * length))).toDouble(),
          length,
          false,
          paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) => false;
}
