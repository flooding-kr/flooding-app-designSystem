import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

enum FloodingTextFieldState {
  basic,
  email,
  password,
  search,
}

class FloodingTextField extends StatefulWidget {
  final FloodingTextFieldState textFieldState;
  final TextEditingController controller;
  final String? validator;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color cursorColor;
  final Color cursorErrorColor;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final TextStyle hintStyle;
  final Color hintColor;
  final TextStyle errorStyle;
  final Color errorColor;
  final BorderSide errorBorderSide;
  final VoidCallback? onEditingComplete;
  final EdgeInsetsGeometry searchIconPadding;
  final double searchIconSize;
  final Color searchIconColor;
  final EdgeInsetsGeometry passwordIconPadding;
  final double passwordIconSize;
  final Color passwordOnIconColor;
  final Color passwordOffIconColor;

  const FloodingTextField({
    super.key,
    required this.textFieldState,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onEditingComplete,
    this.backgroundColor = FloodingColor.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.textStyle = FloodingTypography.body3Regular,
    this.cursorColor = FloodingColor.main600,
    this.cursorErrorColor = FloodingColor.error,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    this.hintStyle = FloodingTypography.body3Regular,
    this.hintColor = FloodingColor.gray500,
    this.errorStyle = FloodingTypography.caption2Medium,
    this.errorColor = FloodingColor.error,
    this.errorBorderSide =
        const BorderSide(color: FloodingColor.error, width: 1),
    this.searchIconPadding = const EdgeInsets.symmetric(
      horizontal: 28,
      vertical: 12,
    ),
    this.searchIconSize = 36,
    this.searchIconColor = FloodingColor.gray700,
    this.passwordIconPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
    this.passwordIconSize = 24,
    this.passwordOffIconColor = FloodingColor.gray500,
    this.passwordOnIconColor = FloodingColor.black,
  });

  @override
  State<FloodingTextField> createState() => _FloodingTextFieldState();
}

class _FloodingTextFieldState extends State<FloodingTextField> {
  bool _isObscureText = true;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력하세요.';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return '유효한 이메일 형식이 아닙니다.';
    }
    return null; // 유효하면 null 반환
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]+$')
        .hasMatch(value)) {
      return '영문과 숫자를 포함해야 합니다.';
    }
    return null; // 통과하면 null 반환
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: (value) {
        if (widget.textFieldState == FloodingTextFieldState.email) {
          return _validateEmail(value);
        } else if (widget.textFieldState == FloodingTextFieldState.password) {
          return _validatePassword(value);
        } else if (widget.textFieldState == FloodingTextFieldState.basic &&
            widget.validator != null) {
          return widget.validator;
        } else {
          return null;
        }
      },
      style: widget.textStyle,
      cursorColor: widget.cursorColor,
      cursorErrorColor: widget.cursorErrorColor,
      onEditingComplete: widget.onEditingComplete,
      obscureText: widget.textFieldState == FloodingTextFieldState.password
          ? _isObscureText
          : false,
      decoration: InputDecoration(
        suffixIcon: widget.textFieldState == FloodingTextFieldState.search
            ? GestureDetector(
                onTap: widget.onEditingComplete,
                child: Padding(
                  padding: widget.searchIconPadding,
                  child: FloodingIcon.search(
                    color: widget.searchIconColor,
                    height: widget.searchIconSize,
                    width: widget.searchIconSize,
                  ),
                ),
              )
            : widget.textFieldState == FloodingTextFieldState.password
                ? GestureDetector(
                    onTap: () => setState(() {
                      _isObscureText = !_isObscureText;
                    }),
                    child: Padding(
                      padding: widget.passwordIconPadding,
                      child: _isObscureText
                          ? FloodingIcon.eyeClose(
                              color: widget.passwordOffIconColor,
                              height: widget.passwordIconSize,
                              width: widget.passwordIconSize,
                            )
                          : FloodingIcon.eyeOpen(
                              color: widget.passwordOnIconColor,
                              height: widget.passwordIconSize,
                              width: widget.passwordIconSize,
                            ),
                    ),
                  )
                : null,
        filled: true,
        fillColor: widget.backgroundColor,
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle.copyWith(
          color: widget.hintColor,
        ),
        errorStyle: widget.errorStyle.copyWith(
          color: widget.errorColor,
        ),
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: widget.errorBorderSide,
        ),
      ),
    );
  }
}
