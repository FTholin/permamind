import 'package:charts_flutter/flutter.dart' as charts;

class VeggiePlot {
  final double xPosition;
  final double yPosition;
  final double radius;
  final String shape;
  final charts.Color fillColor;
  final double strokeWidth;

  VeggiePlot(this.xPosition, this.yPosition, this.radius, this.shape,
      this.fillColor, this.strokeWidth);
}