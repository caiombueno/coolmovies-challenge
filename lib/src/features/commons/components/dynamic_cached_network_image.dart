import 'package:cached_network_image/cached_network_image.dart';
import 'package:coolmovies/src/constants/app_sizes.dart';
import 'package:coolmovies/src/features/commons/components/failure_indicator.dart';
import 'package:coolmovies/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// A network image using a caching mechanism.
/// It displays a loading indicator while the image is being fetched,
/// and an error indicator if the image fails to load.
class DynamicCachedNetworkImage extends StatelessWidget {
  const DynamicCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.fit,
  });
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      fit: fit,
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
      errorWidget: (_, __, ___) => const _ImageErrorIndicator(),
    );
  }
}

class _ImageErrorIndicator extends StatelessWidget {
  const _ImageErrorIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FailureIndicator(
      context.l10n.movieImageErrorMessage,
      iconSize: Sizes.p32,
    ));
  }
}
