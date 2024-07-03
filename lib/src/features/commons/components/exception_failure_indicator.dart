import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/commons/components/failure_indicator.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

/// A widget that displays an exception message with an error icon.
class ExceptionFailureIndicator extends StatelessWidget {
  const ExceptionFailureIndicator(
    this.exception, {
    super.key,
    this.iconSize = Sizes.p48,
    this.iconColor = Colors.red,
  });
  final DomainException exception;
  final double iconSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return FailureIndicator(
      exception.getMessage(context),
      iconSize: iconSize,
      iconColor: iconColor,
    );
  }
}
