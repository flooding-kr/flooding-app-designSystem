import 'package:flutter/material.dart';
import '../flooding_app_design_system.dart';

class FloodingDefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color color;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color textColor;

  const FloodingDefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
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
        padding: padding,
        alignment: Alignment.center,
        width: width,
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
