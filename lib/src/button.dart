import 'package:flooding_app_design_system/src/color.dart';
import 'package:flutter/material.dart';

class FloodingButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final BorderRadius borderRadius;
  final VoidCallback onTap;

  const FloodingButton({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
    this.color = FloodingColor.main600,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
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
        child: child,
      ),
    );
  }
}
