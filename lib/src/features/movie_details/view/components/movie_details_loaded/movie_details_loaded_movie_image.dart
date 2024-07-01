import 'package:coolmovies/src/features/commons/views/movie_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsLoadedMovieImage extends StatelessWidget {
  const MovieDetailsLoadedMovieImage({super.key, required this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final url = imageUrl;

    const blackColor = Colors.black;
    const transparentColor = Colors.transparent;
    const foregroundDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [blackColor, transparentColor, transparentColor, blackColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0, 0.1, 0.9, 1],
      ),
    );

    return (url != null)
        ? MovieImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              height: screenSize.height * 0.7,
              foregroundDecoration: foregroundDecoration,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
