import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/movie_details/view/components/movie_details_loaded/movie_details_loaded_movie_image.dart';
import 'package:coolmovies/src/features/movie_reviews/view/view.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:coolmovies/src/models/models.dart';
import 'package:flutter/material.dart';

class MovieDetailsLoadedView extends StatelessWidget {
  const MovieDetailsLoadedView(this.movieDetails, {super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(elevation: 0, backgroundColor: Colors.transparent);

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(top: Sizes.p32),
        child: _MovieDetailsLoadedBody(movieDetails: movieDetails),
      ),
    );
  }
}

class _MovieDetailsLoadedBody extends StatelessWidget {
  const _MovieDetailsLoadedBody({required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final reviews = movieDetails.reviews;

    final reviewsSectionTitle = Text(
      context.l10n.reviewsSectionTitle,
      style: Theme.of(context).textTheme.titleLarge,
    );
    final reviewsSection = [
      SliverList.list(children: [
        reviewsSectionTitle,
        gapH12,
        const AddReviewButton(),
        gapH12,
      ]),
      _MovieReviewSliverList(
        reviews: reviews,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      )
    ];

    final divider = SliverList.list(
      children: const [
        gapH12,
        Divider(),
        gapH12,
      ],
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _MovieDetailsInfo(movieDetails)),
        divider,
        ...reviewsSection
        // MovieReviewsSection(reviews),
      ],
    );
  }
}

class _MovieDetailsInfo extends StatelessWidget {
  const _MovieDetailsInfo(this.movieDetails);

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final title = movieDetails.title;
    final titleText = title != null
        ? Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          )
        : null;

    final releaseDate = movieDetails.formattedReleaseDate;
    final realeaseDateText = releaseDate != null
        ? Text(
            context.l10n.releaseDateIndicator(releaseDate),
            style: Theme.of(context).textTheme.titleSmall,
          )
        : null;

    final directorName = movieDetails.director?.name;
    final directorNameText = directorName != null
        ? Text(
            context.l10n.directorNameIndicator(directorName),
            style: Theme.of(context).textTheme.titleSmall,
          )
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailsLoadedMovieImage(imageUrl: movieDetails.imgUrl),
        if (titleText != null) ...[titleText, gapH12],
        if (realeaseDateText != null) realeaseDateText,
        if (directorNameText != null) directorNameText,
      ],
    );
  }
}

class _MovieReviewSliverList extends StatelessWidget {
  const _MovieReviewSliverList({
    required this.reviews,
    this.padding,
  });

  final List<MovieReview> reviews;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: ((_, index) => Padding(
            padding: padding ?? const EdgeInsets.all(0),
            child: MovieReviewTile(reviews[index]),
          )),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
