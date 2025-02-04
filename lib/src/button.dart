import 'package:flutter/material.dart';
import '../flooding_app_design_system.dart';

class FloodingDefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final Color color;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color textColor;

  const FloodingDefaultButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    this.color = FloodingColor.main600,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
    this.textStyle = FloodingTypography.body1SemiBold,
    this.textColor = FloodingColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: textStyle.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
