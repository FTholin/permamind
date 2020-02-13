import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:permamind/models/models.dart';

class VeggiesDesignChart extends StatelessWidget {
  
  final List<VeggieRow> veggies;

  final double parcelWidth;
  final double parcelLength;

  List<charts.Series> veggiesList;

  final bool animate;

  VeggiesDesignChart(this.parcelWidth, this.parcelLength, this.veggies,
      {this.animate = false}) {
    this.veggiesList = _createSampleData(this.veggies);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(
      veggiesList,
      animate: animate,
      // Custom xAxis
      primaryMeasureAxis: new charts.NumericAxisSpec(
        viewport: new charts.NumericExtents(0.0, 80.0),
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(
          zeroBound: true,
          dataIsInWholeNumbers: false,
          desiredTickCount: 9,
        ),
      ),
      // Custom yAxis
      domainAxis: charts.NumericAxisSpec(
        viewport: new charts.NumericExtents(0.0, 40.0),
        tickProviderSpec: new charts.BasicNumericTickProviderSpec(
          zeroBound: true,
          dataIsInWholeNumbers: false,
          desiredTickCount: 21,
        ),
      ),

      defaultRenderer:
      new charts.PointRendererConfig<num>(customSymbolRenderers: {
        'circle': new charts.CircleSymbolRenderer(),
        'rect': new charts.RectSymbolRenderer(),
      }),
      behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
//          // For a legend that is positioned on the left or right of the chart,
//          // setting the justification for [endDrawArea] is aligned to the
//          // bottom of the chart draw area.
////          outsideJustification: charts.OutsideJustification.endDrawArea,
//          // By default, if the position of the chart is on the left or right of
//          // the chart, [horizontalFirst] is set to false. This means that the
//          // legend entries will grow as new rows first instead of a new column.
//          horizontalFirst: true,
//          // By setting this value to 2, the legend entries will grow up to two
//          // rows before adding a new column.
//          desiredMaxRows: 1,
//          // This defines the padding around each legend entry.
////          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 50.0),
//          // Render the legend entry text with custom styles.
//          entryTextStyle: charts.TextStyleSpec(
////              color: charts.Color(r: 127, g: 63, b: 191),
//              fontFamily: 'Georgia',
//              fontSize: 11),
        )
      ],
    );
  }

  List<charts.Series<VeggiePlot, int>> _createSampleData(
      List<VeggieRow> fetchVeggies) {
    Map<String, List> veggies = Map<String, List>();

    fetchVeggies.forEach((item) {
      if (veggies[item.name] == null) {
        veggies[item.name] = [item];
      } else {
        veggies[item.name].addAll([item]);
      }
    });

    List<charts.Series<VeggiePlot, int>> data =
    new List<charts.Series<VeggiePlot, int>>();

    veggies.forEach((k, veggies) {
      List<VeggiePlot> finalVeggies = List<VeggiePlot>();

      for (final VeggieRow veggieRow in veggies) {
        for (double i = veggieRow.xPosition;
        i <= parcelLength;
        i += veggieRow.space) {
          finalVeggies
              .add(VeggiePlot(i, veggieRow.yPosition, 3.0, null, null, null));
        }
      }

      data.add(charts.Series<VeggiePlot, int>(
          id: '$k',
          domainFn: (VeggiePlot veggies, _) => veggies.xPosition.toInt(),
          measureFn: (VeggiePlot veggies, _) => veggies.yPosition,
          radiusPxFn: (VeggiePlot veggies, _) => veggies.radius,
          fillColorFn: (VeggiePlot row, _) => row.fillColor,
          strokeWidthPxFn: (VeggiePlot row, _) => row.strokeWidth,
          data: finalVeggies));
    });

    return data;
  }
}


