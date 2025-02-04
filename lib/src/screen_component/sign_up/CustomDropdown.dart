import 'package:flutter/material.dart';

class SignUpDropdown extends StatefulWidget {
  const SignUpDropdown({super.key});

  @override
  State<SignUpDropdown> createState() => _SignUpDropdownState();
}

class _SignUpDropdownState extends State<SignUpDropdown> {
  final List<String> _cities = ['서울', '대전', '대구', '부산', '인천', '울산', '광주'];
  String _selectedCity = '서울'; // 기본 선택값
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

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
            // 드롭다운 외부 클릭 시 닫힘
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
                    children: _cities.map((city) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCity = city;
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selectedCity, style: TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
