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
    return GestureDetector(
      onTap: () => MovieDetailsRoute(movieSummary.id).push(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p4),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        margin: const EdgeInsets.all(Sizes.p8),
        padding: const EdgeInsets.all(Sizes.p8),
        child: _CustomGridTile(
          footer: _GridTileFooter(
            title: title,
            overallRating: overallRating,
          ),
          child: (imageUrl != null) ? _LeadingImage(imageUrl: imageUrl) : null,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (titleString != null)
            Flexible(
              flex: 2,
              child: Text(
                titleString,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          Flexible(
            flex: 1,
            child: Text(
              overallRating.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: move this widget
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

class _LeadingImage extends StatelessWidget {
  const _LeadingImage({required this.imageUrl});
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
