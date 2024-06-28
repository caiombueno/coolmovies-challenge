import 'dart:io';
import 'package:coolmovies/src/data/data_sources/operations/operations.dart';
import 'package:coolmovies/src/models/exceptions.dart';
import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieDataSource {
  late final GraphQLClient _client;

  MovieDataSource(@visibleForTesting GraphQLClient? client) {
    final httpLink = HttpLink(
      Platform.isAndroid
          ? 'http://10.0.2.2:5001/graphql'
          : 'http://localhost:5001/graphql',
    );
    _client = client ??
        GraphQLClient(
          link: httpLink,
          cache: GraphQLCache(store: InMemoryStore()),
        );
  }

  Future<Either<Exception, List<MovieSummary>>> getMovieSummaryList() async {
    try {
      final result = await _client
          .query$GetMovieSummaryList(Options$Query$GetMovieSummaryList())
          .onError((_, __) => throw const QueryFailureException());

      final data = result.data;

      if (data == null || data.isEmpty) throw const EmptyResultException();

      final movieSummaries = _MovieDataSourceParser.parseMovieSummaryList(data);

      return movieSummaries.fold(
        (exception) => throw exception,
        (summaries) => Either.right(summaries),
      );
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e) {
      return Either.left(Exception(e.toString()));
    }
  }
}

class _MovieDataSourceParser {
  static Either<DataFormatFailureException, List<MovieSummary>>
      parseMovieSummaryList(Map<String, dynamic> data) {
    return Either.tryCatch(
      () {
        final parsedData = Query$GetMovieSummaryList.fromJson(data);

        final List<MovieSummary> movieSummaries = parsedData.allMovies.nodes
            .map(
              (e) => MovieSummary(
                id: e.id,
                title: e.title,
                imgUrl: e.imgUrl,
                releaseDate: e.releaseDate,
              ),
            )
            .toList();

        return movieSummaries;
      },
      (_, __) => const DataFormatFailureException(),
    );
  }
}
