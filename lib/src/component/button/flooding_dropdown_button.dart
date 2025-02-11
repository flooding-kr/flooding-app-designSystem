import 'package:flutter/material.dart';

import '../../../../flooding_app_design_system.dart';

class FloodingDropdownButton extends StatefulWidget {
  final Function(String) onTap;
  final double width;
  final List<String> showList;
  final String defaultValue;

  const FloodingDropdownButton({
    super.key,
    required this.onTap,
    required this.showList,
    required this.defaultValue,
    this.width = double.infinity,
  });

  @override
  State<FloodingDropdownButton> createState() => _FloodingDropdownButtonState();
}

class _FloodingDropdownButtonState extends State<FloodingDropdownButton> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.defaultValue;
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < widget.showList.length; i++) ...[
                          InkWell(
                            onTap: () {
                              setState(() {
                                _selectedItem = widget.showList[i];
                              });
                              widget.onTap(_selectedItem);
                              _hideDropdown();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Text(
                                widget.showList[i],
                                style:
                                    FloodingTypography.body2SemiBold.copyWith(
                                  color: widget.showList[i] == _selectedItem
                                      ? FloodingColor.black
                                      : FloodingColor.gray500,
                                ),
                              ),
                            ),
                          ),
                          if (i < widget.showList.length - 1) ...[
                            const SizedBox(height: 20),
                            Container(
                              height: 1,
                              width: 30,
                              color: FloodingColor.gray200,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ],
                      ],
                    ),
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
                _selectedItem,
                style: FloodingTypography.body3Regular
                    .copyWith(color: FloodingColor.gray500),
              ),
              FloodingIcon.arrowDown(),
            ],
          ),
        ),
      ),
    );
  }
}
