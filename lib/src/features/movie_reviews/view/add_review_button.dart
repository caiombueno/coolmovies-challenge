import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(context.l10n.addReviewButtonLabel),
    );
  }
}
