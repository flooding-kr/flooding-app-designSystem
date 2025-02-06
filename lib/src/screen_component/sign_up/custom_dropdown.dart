import 'package:flutter/material.dart';

import '../../../flooding_app_design_system.dart';

class SignUpDropdown extends StatefulWidget {
  final List<String> cities; // 리스트 입력
  final String defaultCity; // 기본값 입력

  const SignUpDropdown({
    super.key,
    required this.cities,
    required this.defaultCity,
  });

  @override
  State<SignUpDropdown> createState() => _SignUpDropdownState();
}

class _SignUpDropdownState extends State<SignUpDropdown> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _hideDropdown();
    }
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size buttonSize = renderBox.size;
    Offset buttonPosition = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _hideDropdown,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy + buttonSize.height,
              width: buttonSize.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                offset: Offset(0, buttonSize.height),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.cities.map((city) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                          });
                          _hideDropdown();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: Text(city, style: TextStyle(fontSize: 16)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: FloodingColor.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '_selectedCity',
                style: FloodingTypography.body3Regular
                    .copyWith(color: FloodingColor.gray500),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
