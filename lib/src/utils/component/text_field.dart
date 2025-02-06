import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

enum FloodingTextFieldState {
  basic,
  email,
  password,
  search,
}

class FloodingEmailTextField extends StatelessWidget {
  final FloodingTextFieldState textFieldState;
  final TextEditingController controller;
  final String? validator;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color cursorColor;
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final TextStyle hintStyle;
  final Color hintColor;
  final TextStyle errorStyle;
  final Color errorColor;

  const FloodingEmailTextField({
    super.key,
    required this.textFieldState,
    required this.controller,
    required this.hintText,
    this.validator,
    this.backgroundColor = FloodingColor.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.textStyle = FloodingTypography.body3Regular,
    this.cursorColor = FloodingColor.main600,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    this.hintStyle = FloodingTypography.body3Regular,
    this.hintColor = FloodingColor.gray500,
    this.errorStyle = FloodingTypography.caption2Medium,
    this.errorColor = FloodingColor.error,
  });

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUnfocus,
          validator: (value) {
            if (textFieldState == FloodingTextFieldState.email) {
              _validateEmail(value);
            } else if (textFieldState == FloodingTextFieldState.password) {
              _validatePassword(value);
            } else if (textFieldState == FloodingTextFieldState.basic &&
                validator != null) {
              validator;
            } else {
              return null;
            }
            return null;
          },
          style: textStyle,
          cursorColor: cursorColor,
          obscureText:
              textFieldState == FloodingTextFieldState.password ? true : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundColor,
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: hintStyle.copyWith(
              color: hintColor,
            ),
            errorStyle: errorStyle.copyWith(
              color: errorColor,
            ),
            label: ,
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
