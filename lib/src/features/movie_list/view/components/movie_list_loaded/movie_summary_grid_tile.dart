import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/commons/views/movie_image.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:coolmovies/src/routing/app_router.dart';
import 'package:flutter/material.dart';

class MovieSummaryGridTile extends StatelessWidget {
  const MovieSummaryGridTile(this.movieSummary, {super.key});
  final MovieSummary movieSummary;

  @override
  Widget build(BuildContext context) {
    final title = movieSummary.title;
    final overallRating = movieSummary.overallRating;
    final imageUrl = movieSummary.imgUrl;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(Sizes.p4),
      // color: Colors.white,
      border: Border.all(width: 0.5, color: Colors.white),
    );

    final footer = _GridTileFooter(
      title: title,
      overallRating: overallRating,
    );

    return GestureDetector(
      onTap: () => MovieDetailsRoute(movieSummary.id).push(context),
      child: Container(
        decoration: decoration,
        margin: const EdgeInsets.all(Sizes.p8),
        padding: const EdgeInsets.all(Sizes.p8),
        child: _CustomGridTile(
          footer: footer,
          child: (imageUrl != null) ? _MovieImage(imageUrl: imageUrl) : null,
        ),
      ),
    );
  }
}

class _GridTileFooter extends StatelessWidget {
  const _GridTileFooter({
    required this.title,
    required this.overallRating,
  });

  final String? title;
  final double overallRating;

  @override
  Widget build(BuildContext context) {
    final titleString = title;
    final titleText = (titleString != null)
        ? Text(
            titleString,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        : null;

    final ratingIndicator = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        _RatingIndicator(overallRating),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (titleText != null) Flexible(flex: 2, child: titleText),
          Flexible(flex: 1, child: ratingIndicator),
        ],
      ),
    );
  }
}

class _RatingIndicator extends StatelessWidget {
  const _RatingIndicator(this.rating);
  final double rating;

  @override
  Widget build(BuildContext context) {
    const starIcon = Icon(
      Icons.star,
      color: Colors.yellow,
      size: Sizes.p16,
    );

    final ratingText = Text(
      rating.toString(),
      style: const TextStyle(
        fontSize: Sizes.p12,
        fontWeight: FontWeight.bold,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        starIcon,
        ratingText,
      ],
    );
  }
}

class _CustomGridTile extends StatelessWidget {
  const _CustomGridTile({this.child, this.footer});
  final Widget? child;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final childWidget = child;
    final footerWidget = footer;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (childWidget != null)
          Expanded(
            flex: 4,
            child: childWidget,
          ),
        if (footerWidget != null) Expanded(child: footerWidget),
      ],
    );
  }
}

class _MovieImage extends StatelessWidget {
  const _MovieImage({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return MovieImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p4),
          image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}
