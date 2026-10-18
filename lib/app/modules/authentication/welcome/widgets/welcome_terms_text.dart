import 'package:flutter/material.dart';

class WelcomeTermsText extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const WelcomeTermsText({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'By continuing, you agree to our Terms of Service and Privacy Policy.',
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            height: 1.5,
          ),
        ),
      ),
    );
  }
}