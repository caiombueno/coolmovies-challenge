import 'dart:io';
import 'package:coolmovies/src/data/data_sources/operations/operations.dart';
import 'package:coolmovies/src/models/exceptions.dart';
import 'package:coolmovies/src/models/movie_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class MovieDataSource {
  late final GraphQLClient _client;

  MovieDataSource(
    @visibleForTesting GraphQLClient? client,
  ) {
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

  Future<List<MovieSummary>> getMovieSummaryList() async {
    final result = await _client
        .query$GetMovieSummaryList(Options$Query$GetMovieSummaryList(
      onError: (error) => throw const FetchDataFailureException(),
    ));

    if (result.hasException) throw const FetchDataFailureException();
    final data = result.data;

    if (data == null || data.isEmpty) throw const NoDataFoundException();

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
  }
}
