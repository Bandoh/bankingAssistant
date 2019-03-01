import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart' as bar;
class Barchart extends StatefulWidget {
  final double buy,sell;
  final String currency;
  Barchart({@required this.currency,@required this.buy,@required this.sell});

  @override
  _BarchartState createState() => _BarchartState();
}

class _BarchartState extends State<Barchart> {
  bar.ChartOptions _verticalBarChartOptions;
  bar.LabelLayoutStrategy _xContainerLabelLayoutStrategy;
  bar.ChartData _chartData;
  @override
  Widget build(BuildContext context) {
        defineOptionsAndData();
    bar.VerticalBarChart verticalBarChart = new bar.VerticalBarChart(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 2),
      painter: new bar.VerticalBarChartPainter(),
      container: new bar.VerticalBarChartContainer(
        chartData: _chartData, // @required
        chartOptions: _verticalBarChartOptions, // @required
        xContainerLabelLayoutStrategy:
            _xContainerLabelLayoutStrategy, // @optional
      ),
    );
    return Container(
      child: verticalBarChart,
    );
  }

  void defineOptionsAndData() {
    _verticalBarChartOptions = new bar.VerticalBarChartOptions();
    _chartData = new bar.ChartData();
    _chartData.dataRowsLegends = [widget.currency];
    _chartData.dataRowsColors = [Colors.redAccent];
    _chartData.dataRows = [
      [widget.buy, widget.sell],
    ];
    _chartData.xLabels = [
      "Buy\n${widget.buy}",
      "Sell\n${widget.sell}",
    ];
    _chartData.assignDataRowsDefaultColors();
  }

  void _chartStateChanger() {
    setState(() {
      defineOptionsAndData();
    });
  }
}