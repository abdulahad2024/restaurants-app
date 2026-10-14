import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

enum CustomButtonType { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.height = 50.0,
    this.fontSize = 16.0,
  });

  final String text;
  final VoidCallback? onPressed;
  final CustomButtonType type;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // বাটন চাইল্ড (টেক্সট, আইকন অথবা লোডিং স্পিন্ডার)
    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                type == CustomButtonType.primary
                    ? AppColor.textOnPrimary
                    : AppColor.primary,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ] else if (icon != null) ...[
          Icon(
            icon,
            size: AppSize.iconSm,
            color: textColor ?? _getDefaultTextColor(theme),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: textColor ?? _getDefaultTextColor(theme),
          ),
        ),
      ],
    );

    // মূল বাটন উইজেট
    Widget button;

    switch (type) {
      case CustomButtonType.primary:
      case CustomButtonType.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ??
                (type == CustomButtonType.primary
                    ? AppColor.primary
                    : AppColor.secondary),
            disabledBackgroundColor: AppColor.buttonDisabled,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: child,
        );
        break;

      case CustomButtonType.outline:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: backgroundColor ?? AppColor.buttonOutline,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: child,
        );
        break;

      case CustomButtonType.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            ),
            minimumSize: Size(isFullWidth ? double.infinity : 0, height),
          ),
          child: child,
        );
        break;
    }

    return isFullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  Color _getDefaultTextColor(ThemeData theme) {
    if (onPressed == null) {
      return AppColor.buttonDisabledText;
    }
    switch (type) {
      case CustomButtonType.primary:
      case CustomButtonType.secondary:
        return AppColor.textOnPrimary;
      case CustomButtonType.outline:
      case CustomButtonType.text:
        return backgroundColor ?? AppColor.primary;
    }
  }
}