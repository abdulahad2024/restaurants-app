import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';

enum DialogType { info, success, warning, error, confirmation }

class CustomDialog {
  CustomDialog._(); // Prevent direct instantiation

  /// Universal custom dialog method synced with your AppTheme
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    DialogType type = DialogType.info,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentColor = _getTypeColor(type, colorScheme);

    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          // আপনার AppTheme-এর dialogTheme প্রোপার্টি থেকে অটো শেপ, ব্যাকগ্রাউন্ড ও স্টাইল পাবে
          icon: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getIcon(type),
              color: accentColor,
              size: 28,
            ),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              children: [
                if (type == DialogType.confirmation || cancelText != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        onCancel?.call();
                      },
                      child: Text(cancelText ?? 'Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      foregroundColor: AppColor.white,
                    ),
                    child: Text(confirmText ?? 'Okay'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // ডায়ালগের আইকন নির্ধারণ
  static IconData _getIcon(DialogType type) {
    switch (type) {
      case DialogType.info:
        return Icons.info_outline;
      case DialogType.success:
        return Icons.check_circle_outline;
      case DialogType.warning:
        return Icons.warning_amber_rounded;
      case DialogType.error:
        return Icons.error_outline;
      case DialogType.confirmation:
        return Icons.help_outline;
    }
  }

  // ডায়ালগের থেম কালার নির্ধারণ
  static Color _getTypeColor(DialogType type, ColorScheme colorScheme) {
    switch (type) {
      case DialogType.info:
        return colorScheme.primary;
      case DialogType.success:
        return AppColor.success;
      case DialogType.warning:
        return AppColor.warning;
      case DialogType.error:
        return colorScheme.error;
      case DialogType.confirmation:
        return colorScheme.primary;
    }
  }
}