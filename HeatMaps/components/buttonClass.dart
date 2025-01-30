
import 'package:flutter/material.dart';

class ButtonsClass extends StatelessWidget {
  final int year;
  final bool isSelected;
  final Function(int) onTap;

  const ButtonsClass({
    super.key,
    required this.year,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(year);
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.green : Colors.green[200],
        ),
        child: Center(
          child: Text(
            year.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
