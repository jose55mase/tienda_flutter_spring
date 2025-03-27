import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/entitys/sale_entity.dart';
import 'package:shop_app/models/sales_module.dart';
import 'package:shop_app/providers/sales_provider.dart';

import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsTemplate extends StatefulWidget {
  @override
  State<StatisticsTemplate> createState() => _StatisticsTemplateState();
}

class _StatisticsTemplateState extends State<StatisticsTemplate> {
  SalesModule salesModule = new SalesModule();
  List<SaleEntity> list = [];
  bool loading = true;
  dynamic _tooltipBehavior;

  @override
  void didUpdateWidget(covariant StatisticsTemplate oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  initState() {
    this.loading = true;
    this.loadData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  loadData() async {
    var response = await salesModule.findAll(context);
    setState(() {
      this.list = response;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final salesProvider = Provider.of<SalesProvider>(context);

    final List<ChartData> chartData = [
      ChartData('PROCESADAS',
          salesModule.getStatistic(context, this.list)["1"].toDouble()),
      ChartData('EN ESPERA',
          salesModule.getStatistic(context, this.list)["0"].toDouble()),
    ];

    if (this.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        Container(
          child: SfCircularChart(
            title: ChartTitle(text: 'Estado de ventas'),
            legend: Legend(isVisible: true),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataLabelSettings: DataLabelSettings(isVisible: true),
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              )
            ],
            palette: const [
              Color(0xFF14D11D),
              Color(0xFFF64209),
            ],
          ),
        ),
        Container(
          child: Center(
            child: Column(
              children: [
                Text("Ventas realizadas en dias",style: TextStyle(fontSize: 17),),
                Container(
                    child:
                    SfCartesianChart(series: <CartesianSeries<ChartDataTwo, int>>[
                      // Renders column chart
                      ColumnSeries<ChartDataTwo, int>(
                          dataSource: chartDatas,
                          xValueMapper: (ChartDataTwo data, _) => data.x,
                          yValueMapper: (ChartDataTwo data, _) => data.y)
                    ])),
              ],
            ),
          ),
        )
      ],
    );
  }
}

final List<ChartDataTwo> chartDatas = [
  ChartDataTwo(1, 35),
  ChartDataTwo(2, 23),
  ChartDataTwo(3, 34),
  ChartDataTwo(4, 25),
  ChartDataTwo(5, 40),
  ChartDataTwo(6, 20),
  ChartDataTwo(7, 60),
];

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class ChartDataTwo {
  ChartDataTwo(this.x, this.y);
  final int x;
  final double y;
}
