import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartTest extends StatefulWidget {
  final List<int> emotions;
  final DateTime startDate;
  final DateTime endDate;

  const BarChartTest({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.emotions,
  });

  @override
  State<BarChartTest> createState() => _BarChartTestState();
}

class _BarChartTestState extends State<BarChartTest> {
  late List<BarChartGroupData> _barGroups;

  @override
  void initState() {
    super.initState();
    _barGroups = _createBarGroups(widget.emotions);
  }

  @override
  void didUpdateWidget(covariant BarChartTest oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.emotions != oldWidget.emotions) {
      _barGroups = _createBarGroups(widget.emotions);
    }
  }

  List<BarChartGroupData> _createBarGroups(List<int> values) {
    const colors = [
      Color(0xff845EC2),
      Color(0xffD65DB1),
      Color(0xffFF6F91),
      Color(0xffFF9671),
      Color(0xffFFC75F),
    ];

    return List.generate(values.length, (index) {
      return BarChartGroupData(x: index, barRods: [
        BarChartRodData(
          toY: values[index].toDouble(),
          color: colors[index],
          width: 20,
          borderRadius: BorderRadius.zero,
        )
      ]);
    });
  }

  BarTouchData _createBarTouchData() => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.white,
          tooltipPadding: const EdgeInsets.all(8),
          getTooltipItem: (group, groupIndex, rod, _) {
            const labels = [
              '기쁨',
              '슬픔',
              '불안',
              '분노',
              '놀람',
            ];
            final label = labels[group.x.toInt()];
            final value = rod.toY.toStringAsFixed(2);
            return BarTooltipItem(
              '$label: $value',
              TextStyle(
                color: rod.color,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: _barGroups.isNotEmpty ? _barGroups : [],
        barTouchData: _createBarTouchData(),
        titlesData: const FlTitlesData(show: false),
      ),
      swapAnimationDuration: const Duration(milliseconds: 500),
      swapAnimationCurve: Curves.linear,
    );
  }
}
