import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;

  WatermarkPaint(this.price, this.watermark);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawCircle(Offset(size.width / 1, size.height / 1), 1.8,
        Paint()..color = Colors.black12);
  }

  @override
  bool shouldRepaint(WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatermarkPaint &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}
