import 'package:flooding_app_design_system/src/color.dart';
import 'package:flutter/material.dart';

class FloodingButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final VoidCallback onTap;

  const FloodingButton({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      onTap: onTap,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: FloodingColor.main600,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
