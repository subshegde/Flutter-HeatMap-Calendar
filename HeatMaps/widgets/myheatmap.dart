import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Map<DateTime, int> dataSets;
  final bool isNeedText;

  MyHeatMap({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.dataSets,
    required this.isNeedText,
  });

  Map<int, Color> greenShades = {
    1: const Color.fromARGB(20, 2, 199, 8),
    2: const Color.fromARGB(40, 2, 199, 8),
    3: const Color.fromARGB(60, 2, 199, 8),
    4: const Color.fromARGB(80, 2, 199, 8),
    5: const Color.fromARGB(100, 2, 199, 8),
    6: const Color.fromARGB(120, 2, 199, 8),
    7: const Color.fromARGB(150, 2, 199, 8),
    8: const Color.fromARGB(180, 2, 199, 8),
    9: const Color.fromARGB(220, 2, 199, 8),
    10: const Color.fromARGB(255, 2, 199, 8),
  };

  int getFirstDayOfYear(DateTime date) {
    return DateTime(date.year, 1, 1).weekday;
  }

  @override
  Widget build(BuildContext context) {
    int firstDayOfYear = getFirstDayOfYear(startDate);
    List<int> daysToHideOrGrey = [];
    for (int i = 1; i < firstDayOfYear; i++) {
      daysToHideOrGrey.add(i);
    }

    Map<DateTime, int> modifiedDataSets = {};
    dataSets.forEach((date, value) {
      if (date.isBefore(startDate)) {
        if (daysToHideOrGrey.contains(date.weekday)) {
          modifiedDataSets[date] = 0; 
        }
      } else {
        modifiedDataSets[date] = value;
      }
    });

    return HeatMap(
      textColor: isNeedText ? Colors.black : null,
      datasets: modifiedDataSets,
      startDate: startDate,
      endDate: endDate,
      colorMode: ColorMode.opacity,
      colorsets: greenShades,
      showText: isNeedText ? true : false,
      showColorTip: true,
      scrollable: true,
      size: 25,
      fontSize: 10,
      onClick: (value) {
        int year = value.year;
        int month = value.month;
        int date = value.day;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$date-$month-$year')));
      },
    );
  }
}
