import 'package:flutter/material.dart';
import 'package:flutter_packages/pages/HeatMaps/components/buttonClass.dart';
import 'package:flutter_packages/pages/HeatMaps/widgets/myheatmap.dart';

class Buttons {
  int year;
  Buttons({required this.year});
}

class HeatMapExample extends StatefulWidget {
  const HeatMapExample({super.key});

  @override
  State<HeatMapExample> createState() => _HeatMapExampleState();
}

class _HeatMapExampleState extends State<HeatMapExample> {
  int selectedYear = DateTime.now().year;

  DateTime getStartDate(int year) {
    return DateTime(year, 1, 1); // January 1st of the selected year
  }

  DateTime getEndDate(int year) {
    return DateTime(year, 12, 31); // December 31st of the selected year
  }

  DateTime? startDate;
  DateTime? endDate;

  Map<DateTime, int> rawData = {
    // 2025 Data
    DateTime(2025, 1, 1): 50,
    DateTime(2025, 1, 2): 30,
    DateTime(2025, 1, 3): 70,
    DateTime(2025, 1, 4): 20,
    DateTime(2025, 1, 5): 40,
    DateTime(2025, 1, 6): 60,
    DateTime(2025, 1, 7): 80,
    DateTime(2025, 1, 8): 10,
    DateTime(2025, 1, 9): 25,
    DateTime(2025, 1, 10): 45,
    DateTime(2025, 2, 1): 55,
    DateTime(2025, 2, 2): 35,
    DateTime(2025, 2, 3): 75,
    DateTime(2025, 2, 4): 25,
    DateTime(2025, 2, 5): 45,
    DateTime(2025, 2, 6): 65,
    DateTime(2025, 2, 7): 85,
    DateTime(2025, 3, 1): 60,
    DateTime(2025, 3, 2): 40,
    DateTime(2025, 3, 3): 80,

    DateTime(2025, 12, 3): 10,

    // 2024 Data
    DateTime(2024, 1, 1): 50,
    DateTime(2024, 1, 2): 30,
    DateTime(2024, 1, 3): 70,
    DateTime(2024, 1, 4): 20,
    DateTime(2024, 1, 5): 40,
    DateTime(2024, 1, 6): 60,
    DateTime(2024, 1, 7): 80,
    DateTime(2024, 1, 8): 10,
    DateTime(2024, 1, 9): 25,
    DateTime(2024, 1, 10): 45,
    DateTime(2024, 2, 1): 55,
    DateTime(2024, 2, 2): 35,
    DateTime(2024, 2, 3): 75,
    DateTime(2024, 2, 4): 25,
    DateTime(2024, 2, 5): 45,
    DateTime(2024, 2, 6): 65,
    DateTime(2024, 2, 7): 85,
    DateTime(2024, 3, 1): 60,
    DateTime(2024, 3, 2): 40,
    DateTime(2024, 3, 3): 80,

    // 2023 Data
    DateTime(2023, 1, 1): 50,
    DateTime(2023, 1, 2): 30,
    DateTime(2023, 1, 3): 70,
    DateTime(2023, 1, 4): 20,
    DateTime(2023, 1, 5): 40,
    DateTime(2023, 1, 6): 60,
    DateTime(2023, 1, 7): 80,
    DateTime(2023, 1, 8): 10,
    DateTime(2023, 1, 9): 25,
    DateTime(2023, 1, 10): 45,
    DateTime(2023, 2, 1): 55,
    DateTime(2023, 2, 2): 35,
    DateTime(2023, 2, 3): 75,
    DateTime(2023, 2, 4): 25,
    DateTime(2023, 2, 5): 45,
    DateTime(2023, 2, 6): 65,
    DateTime(2023, 2, 7): 85,
    DateTime(2023, 3, 1): 60,
    DateTime(2023, 3, 2): 40,
    DateTime(2023, 3, 3): 80,
    DateTime(2023, 4, 1): 50,
    DateTime(2023, 4, 2): 30,
    DateTime(2023, 4, 3): 70,
    DateTime(2023, 4, 4): 20,
    DateTime(2023, 4, 5): 40,
    DateTime(2023, 4, 6): 60,
    DateTime(2023, 4, 7): 80,
    DateTime(2023, 4, 8): 10,
    DateTime(2023, 4, 9): 25,
    DateTime(2023, 4, 10): 45,
  };

  Map<DateTime, int> getFilteredData() {
    return Map.fromEntries(
      rawData.entries.where((entry) {
        return entry.key.isAfter(DateTime(selectedYear, 1, 1).subtract(const Duration(days: 1))) &&
               entry.key.isBefore(DateTime(selectedYear + 1, 1, 1));
      }),
    );
  }

  List<Buttons> buttons = [];

  void addButtons() {
    for (int i = 2020; i <= DateTime.now().year; i++) {
      buttons.add(Buttons(year: i));
    }
  }

  String classifyYearlyData(Map<DateTime, int> rawData) {
    Map<int, List<int>> yearlyData = {};

    rawData.forEach((date, value) {
      int year = date.year;
      if (!yearlyData.containsKey(year)) {
        yearlyData[year] = [];
      }
      yearlyData[year]?.add(value);
    });

    StringBuffer classificationResult = StringBuffer();

    yearlyData.forEach((year, values) {
      double averageValue = values.reduce((a, b) => a + b) / values.length;

      String classification = '';

      if (averageValue <= 30) {
        classification = 'Good';
      } else if (averageValue <= 60) {
        classification = 'Better';
      } else {
        classification = 'Best';
      }

      // classificationResult.writeln('Year: $year,\n Average: $averageValue, \n Classification: $classification');
      classificationResult.writeln('Average: $averageValue,\nClassification: $classification');
    });

    return classificationResult.toString();
  }

  @override
  void initState() {
    super.initState();
    startDate = getStartDate(selectedYear);
    endDate = getEndDate(selectedYear);
    addButtons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: buttons.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonsClass(
                            year: item.year,
                            isSelected: item.year == selectedYear,
                            onTap: (year) {
                              setState(() {
                                selectedYear = year;
                                startDate = getStartDate(selectedYear);
                                endDate = getEndDate(selectedYear);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  if (startDate != null && endDate != null)
                    MyHeatMap(
                      startDate: startDate!,
                      endDate: endDate!,
                      dataSets: getFilteredData(),
                      isNeedText: false,
                    ),
                   const SizedBox(height: 5,), 
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${classifyYearlyData(getFilteredData())}'),
                        )
                  ),
                  if (startDate != null && endDate != null)
                    MyHeatMap(
                      startDate: startDate!,
                      endDate: endDate!,
                      dataSets: getFilteredData(),
                      isNeedText: true,
                    ),
                    const SizedBox(height: 5,), 
                  Container(
                    height: 58,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: 
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${classifyYearlyData(getFilteredData())}'),
                        )
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
