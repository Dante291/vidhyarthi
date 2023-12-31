import 'package:flutter/material.dart';
import 'package:vidhyarthi/pallete.dart';

class RoundedSmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const RoundedSmallButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.backgroundColor = Colors.red,
      this.textColor = Pallete.whiteColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      ),
    );
  }
}
