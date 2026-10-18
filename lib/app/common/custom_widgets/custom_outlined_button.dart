import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool isLoading;

  /// Button full width nibe kina (default: true)
  final bool isExpanded;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius = 16.0,
    this.isLoading = false,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveTextColor = textColor ?? colorScheme.onSurface;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final isDisabled = onPressed == null;

    final button = OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(64, 54),
        padding:
        padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        foregroundColor: effectiveTextColor,
        backgroundColor: Colors.transparent,
        // Press korle halka color overlay
        overlayColor: effectiveTextColor.withOpacity(0.08),
        side: BorderSide(
          color: isDisabled && !isLoading
              ? effectiveBorderColor.withOpacity(0.5)
              : effectiveBorderColor,
          width: 1.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      // Loading hole button disabled hoy, tai disabled style er upor
      // na giye loading e o border ta thik rakhi
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: isLoading
            ? SizedBox(
          key: const ValueKey('loading'),
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.2,
            valueColor: AlwaysStoppedAnimation<Color>(
              effectiveTextColor,
            ),
          ),
        )
            : Row(
          key: const ValueKey('content'),
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 12),
            ],
            Flexible(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize ?? 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                  color: effectiveTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}