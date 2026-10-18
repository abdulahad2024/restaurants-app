import 'package:flutter/material.dart';

class LoginBackButton extends StatelessWidget {
  final ColorScheme colorScheme;
  final Color borderColor;

  const LoginBackButton({
    super.key,
    required this.colorScheme,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}