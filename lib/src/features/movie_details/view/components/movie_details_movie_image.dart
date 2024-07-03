import 'package:coolmovies/src/features/commons/components/dynamic_cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsMovieImage extends StatelessWidget {
  const MovieDetailsMovieImage(
      {super.key, required this.imageUrl, this.gradientColor});
  final String? imageUrl;
  final Color? gradientColor;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    return (url != null)
        ? DynamicCachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) =>
                _MovieDetailsImageContainer(
              imageProvider,
              gradientColor: gradientColor,
            ),
          )
        : const SizedBox.shrink();
  }
}

class _MovieDetailsImageContainer extends StatelessWidget {
  const _MovieDetailsImageContainer(this.imageProvider, {Color? gradientColor})
      : _gradientColor = gradientColor;
  final ImageProvider<Object> imageProvider;
  final Color? _gradientColor;

  @override
  Widget build(BuildContext context) {
    final gradientColor = _gradientColor ?? Colors.transparent;
    const transparentColor = Colors.transparent;
    final foregroundDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          gradientColor,
          transparentColor,
          transparentColor,
          gradientColor
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.1, 0.9, 1],
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      foregroundDecoration: foregroundDecoration,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
