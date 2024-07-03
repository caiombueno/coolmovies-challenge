import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

/// A widget that displays a failure message with an error icon.
class FailureIndicator extends StatelessWidget {
  const FailureIndicator(
    this.message, {
    super.key,
    this.iconSize = Sizes.p48,
    this.iconColor = Colors.red,
  });
  final String message;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error, color: iconColor, size: iconSize),
        gapH8,
        Text(message),
      ],
    );
  }
}
