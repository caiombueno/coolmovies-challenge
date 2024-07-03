import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar(this.rating,
      {super.key, this.color = Colors.yellow, this.maxRating = 5});
  final double rating;
  final Color color;
  final int maxRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxRating,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: color,
        ),
      ),
    );
  }
}
