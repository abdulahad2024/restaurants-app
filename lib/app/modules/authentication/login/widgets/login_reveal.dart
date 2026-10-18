import 'package:flutter/material.dart';

class LoginReveal extends StatelessWidget {
  final Widget child;
  final double begin;

  const LoginReveal({
    super.key,
    required this.child,
    required this.begin,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      curve: Interval(begin, 1.0, curve: Curves.easeOutCubic),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 24 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}