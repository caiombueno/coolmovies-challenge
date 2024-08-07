// ignore_for_file: type=lint
// coverage:ignore-file

import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$GetMovieSummaryList {
  Query$GetMovieSummaryList({
    required this.allMovies,
    this.$__typename = 'Query',
  });

  factory Query$GetMovieSummaryList.fromJson(Map<String, dynamic> json) {
    final l$allMovies = json['allMovies'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieSummaryList(
      allMovies: Query$GetMovieSummaryList$allMovies.fromJson(
          (l$allMovies as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMovieSummaryList$allMovies allMovies;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$allMovies = allMovies;
    resultData['allMovies'] = l$allMovies.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$allMovies = allMovies;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$allMovies,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieSummaryList ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$allMovies = allMovies;
    final lOther$allMovies = other.allMovies;
    if (l$allMovies != lOther$allMovies) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMovieSummaryList
    on Query$GetMovieSummaryList {
  CopyWith$Query$GetMovieSummaryList<Query$GetMovieSummaryList> get copyWith =>
      CopyWith$Query$GetMovieSummaryList(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMovieSummaryList<TRes> {
  factory CopyWith$Query$GetMovieSummaryList(
    Query$GetMovieSummaryList instance,
    TRes Function(Query$GetMovieSummaryList) then,
  ) = _CopyWithImpl$Query$GetMovieSummaryList;

  factory CopyWith$Query$GetMovieSummaryList.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieSummaryList;

  TRes call({
    Query$GetMovieSummaryList$allMovies? allMovies,
    String? $__typename,
  });
  CopyWith$Query$GetMovieSummaryList$allMovies<TRes> get allMovies;
}

class _CopyWithImpl$Query$GetMovieSummaryList<TRes>
    implements CopyWith$Query$GetMovieSummaryList<TRes> {
  _CopyWithImpl$Query$GetMovieSummaryList(
    this._instance,
    this._then,
  );

  final Query$GetMovieSummaryList _instance;

  final TRes Function(Query$GetMovieSummaryList) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? allMovies = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieSummaryList(
        allMovies: allMovies == _undefined || allMovies == null
            ? _instance.allMovies
            : (allMovies as Query$GetMovieSummaryList$allMovies),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieSummaryList$allMovies<TRes> get allMovies {
    final local$allMovies = _instance.allMovies;
    return CopyWith$Query$GetMovieSummaryList$allMovies(
        local$allMovies, (e) => call(allMovies: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieSummaryList<TRes>
    implements CopyWith$Query$GetMovieSummaryList<TRes> {
  _CopyWithStubImpl$Query$GetMovieSummaryList(this._res);

  final TRes _res;

  @override
  call({
    Query$GetMovieSummaryList$allMovies? allMovies,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieSummaryList$allMovies<TRes> get allMovies =>
      CopyWith$Query$GetMovieSummaryList$allMovies.stub(_res);
}

const documentNodeQueryGetMovieSummaryList = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMovieSummaryList'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allMovies'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'nodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'imgUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'movieReviewsByMovieId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'nodes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'rating'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetMovieSummaryList _parserFn$Query$GetMovieSummaryList(
        Map<String, dynamic> data) =>
    Query$GetMovieSummaryList.fromJson(data);
typedef OnQueryComplete$Query$GetMovieSummaryList = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMovieSummaryList?,
);

class Options$Query$GetMovieSummaryList
    extends graphql.QueryOptions<Query$GetMovieSummaryList> {
  Options$Query$GetMovieSummaryList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieSummaryList? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMovieSummaryList? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    _parserFn$Query$GetMovieSummaryList(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMovieSummaryList,
          parserFn: _parserFn$Query$GetMovieSummaryList,
        );

  final OnQueryComplete$Query$GetMovieSummaryList? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMovieSummaryList
    extends graphql.WatchQueryOptions<Query$GetMovieSummaryList> {
  WatchOptions$Query$GetMovieSummaryList({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieSummaryList? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMovieSummaryList,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMovieSummaryList,
        );
}

class FetchMoreOptions$Query$GetMovieSummaryList
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMovieSummaryList(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMovieSummaryList,
        );
}

extension ClientExtension$Query$GetMovieSummaryList on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMovieSummaryList>>
      query$GetMovieSummaryList(
              [Options$Query$GetMovieSummaryList? options]) async =>
          await query(options ?? Options$Query$GetMovieSummaryList());
  graphql.ObservableQuery<Query$GetMovieSummaryList>
      watchQuery$GetMovieSummaryList(
              [WatchOptions$Query$GetMovieSummaryList? options]) =>
          watchQuery(options ?? WatchOptions$Query$GetMovieSummaryList());
  void writeQuery$GetMovieSummaryList({
    required Query$GetMovieSummaryList data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetMovieSummaryList)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMovieSummaryList? readQuery$GetMovieSummaryList(
      {bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetMovieSummaryList)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMovieSummaryList.fromJson(result);
  }
}

class Query$GetMovieSummaryList$allMovies {
  Query$GetMovieSummaryList$allMovies({
    required this.nodes,
    this.$__typename = 'MovieSummaryConnection',
  });

  factory Query$GetMovieSummaryList$allMovies.fromJson(
      Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieSummaryList$allMovies(
      nodes: (l$nodes as List<dynamic>)
          .map((e) => Query$GetMovieSummaryList$allMovies$nodes.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMovieSummaryList$allMovies$nodes> nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$nodes = nodes;
    resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieSummaryList$allMovies ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMovieSummaryList$allMovies
    on Query$GetMovieSummaryList$allMovies {
  CopyWith$Query$GetMovieSummaryList$allMovies<
          Query$GetMovieSummaryList$allMovies>
      get copyWith => CopyWith$Query$GetMovieSummaryList$allMovies(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieSummaryList$allMovies<TRes> {
  factory CopyWith$Query$GetMovieSummaryList$allMovies(
    Query$GetMovieSummaryList$allMovies instance,
    TRes Function(Query$GetMovieSummaryList$allMovies) then,
  ) = _CopyWithImpl$Query$GetMovieSummaryList$allMovies;

  factory CopyWith$Query$GetMovieSummaryList$allMovies.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies;

  TRes call({
    List<Query$GetMovieSummaryList$allMovies$nodes>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Query$GetMovieSummaryList$allMovies$nodes> Function(
              Iterable<
                  CopyWith$Query$GetMovieSummaryList$allMovies$nodes<
                      Query$GetMovieSummaryList$allMovies$nodes>>)
          fn);
}

class _CopyWithImpl$Query$GetMovieSummaryList$allMovies<TRes>
    implements CopyWith$Query$GetMovieSummaryList$allMovies<TRes> {
  _CopyWithImpl$Query$GetMovieSummaryList$allMovies(
    this._instance,
    this._then,
  );

  final Query$GetMovieSummaryList$allMovies _instance;

  final TRes Function(Query$GetMovieSummaryList$allMovies) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieSummaryList$allMovies(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<Query$GetMovieSummaryList$allMovies$nodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes nodes(
          Iterable<Query$GetMovieSummaryList$allMovies$nodes> Function(
                  Iterable<
                      CopyWith$Query$GetMovieSummaryList$allMovies$nodes<
                          Query$GetMovieSummaryList$allMovies$nodes>>)
              fn) =>
      call(
          nodes: fn(_instance.nodes
              .map((e) => CopyWith$Query$GetMovieSummaryList$allMovies$nodes(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies<TRes>
    implements CopyWith$Query$GetMovieSummaryList$allMovies<TRes> {
  _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies(this._res);

  final TRes _res;

  @override
  call({
    List<Query$GetMovieSummaryList$allMovies$nodes>? nodes,
    String? $__typename,
  }) =>
      _res;

  @override
  nodes(fn) => _res;
}

class Query$GetMovieSummaryList$allMovies$nodes {
  Query$GetMovieSummaryList$allMovies$nodes({
    required this.id,
    this.title,
    this.imgUrl,
    this.movieReviewsByMovieId,
    this.$__typename = 'MovieSummary',
  });

  factory Query$GetMovieSummaryList$allMovies$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$imgUrl = json['imgUrl'];
    final l$movieReviewsByMovieId = json['movieReviewsByMovieId'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieSummaryList$allMovies$nodes(
      id: (l$id as String),
      title: (l$title as String?),
      imgUrl: (l$imgUrl as String?),
      movieReviewsByMovieId: l$movieReviewsByMovieId == null
          ? null
          : Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId
              .fromJson((l$movieReviewsByMovieId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? imgUrl;

  final Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId?
      movieReviewsByMovieId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$title = title;
    resultData['title'] = l$title;
    final l$imgUrl = imgUrl;
    resultData['imgUrl'] = l$imgUrl;
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    resultData['movieReviewsByMovieId'] = l$movieReviewsByMovieId?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$imgUrl = imgUrl;
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$imgUrl,
      l$movieReviewsByMovieId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieSummaryList$allMovies$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$imgUrl = imgUrl;
    final lOther$imgUrl = other.imgUrl;
    if (l$imgUrl != lOther$imgUrl) {
      return false;
    }
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    final lOther$movieReviewsByMovieId = other.movieReviewsByMovieId;
    if (l$movieReviewsByMovieId != lOther$movieReviewsByMovieId) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMovieSummaryList$allMovies$nodes
    on Query$GetMovieSummaryList$allMovies$nodes {
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes<
          Query$GetMovieSummaryList$allMovies$nodes>
      get copyWith => CopyWith$Query$GetMovieSummaryList$allMovies$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieSummaryList$allMovies$nodes<TRes> {
  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes(
    Query$GetMovieSummaryList$allMovies$nodes instance,
    TRes Function(Query$GetMovieSummaryList$allMovies$nodes) then,
  ) = _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes;

  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes;

  TRes call({
    String? id,
    String? title,
    String? imgUrl,
    Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  });
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId;
}

class _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes<TRes>
    implements CopyWith$Query$GetMovieSummaryList$allMovies$nodes<TRes> {
  _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes(
    this._instance,
    this._then,
  );

  final Query$GetMovieSummaryList$allMovies$nodes _instance;

  final TRes Function(Query$GetMovieSummaryList$allMovies$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? imgUrl = _undefined,
    Object? movieReviewsByMovieId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieSummaryList$allMovies$nodes(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        imgUrl: imgUrl == _undefined ? _instance.imgUrl : (imgUrl as String?),
        movieReviewsByMovieId: movieReviewsByMovieId == _undefined
            ? _instance.movieReviewsByMovieId
            : (movieReviewsByMovieId
                as Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId {
    final local$movieReviewsByMovieId = _instance.movieReviewsByMovieId;
    return local$movieReviewsByMovieId == null
        ? CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId
            .stub(_then(_instance))
        : CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
            local$movieReviewsByMovieId, (e) => call(movieReviewsByMovieId: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes<TRes>
    implements CopyWith$Query$GetMovieSummaryList$allMovies$nodes<TRes> {
  _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? title,
    String? imgUrl,
    Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId =>
          CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId
              .stub(_res);
}

class Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId {
  Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId({
    required this.nodes,
    this.$__typename = 'MovieReviewConnection',
  });

  factory Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId.fromJson(
      Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
      nodes: (l$nodes as List<dynamic>)
          .map((e) =>
              Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>
      nodes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$nodes = nodes;
    resultData['nodes'] = l$nodes.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$nodes = nodes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$nodes.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$nodes = nodes;
    final lOther$nodes = other.nodes;
    if (l$nodes.length != lOther$nodes.length) {
      return false;
    }
    for (int i = 0; i < l$nodes.length; i++) {
      final l$nodes$entry = l$nodes[i];
      final lOther$nodes$entry = lOther$nodes[i];
      if (l$nodes$entry != lOther$nodes$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId
    on Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId {
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId>
      get copyWith =>
          CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
    TRes> {
  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
    Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId instance,
    TRes Function(
            Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId)
        then,
  ) = _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId;

  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId;

  TRes call({
    List<Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>?
        nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes> Function(
              Iterable<
                  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
                      Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>>)
          fn);
}

class _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
        TRes>
    implements
        CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
            TRes> {
  _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
    this._instance,
    this._then,
  );

  final Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId
      _instance;

  final TRes Function(
      Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<
                Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes nodes(
          Iterable<Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes> Function(
                  Iterable<
                      CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
                          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>>)
              fn) =>
      call(
          nodes: fn(_instance.nodes.map((e) =>
              CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
        TRes>
    implements
        CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId(
      this._res);

  final TRes _res;

  @override
  call({
    List<Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>?
        nodes,
    String? $__typename,
  }) =>
      _res;

  @override
  nodes(fn) => _res;
}

class Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes {
  Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes({
    this.rating,
    this.$__typename = 'MovieReview',
  });

  factory Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$rating = json['rating'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
      rating: (l$rating as num?)?.toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final double? rating;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$rating = rating;
    resultData['rating'] = l$rating;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$rating = rating;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$rating,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes
    on Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes {
  CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes>
      get copyWith =>
          CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
    TRes> {
  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
    Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes
        instance,
    TRes Function(
            Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes)
        then,
  ) = _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes;

  factory CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes;

  TRes call({
    double? rating,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
    this._instance,
    this._then,
  );

  final Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes
      _instance;

  final TRes Function(
          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? rating = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieSummaryList$allMovies$nodes$movieReviewsByMovieId$nodes(
      this._res);

  final TRes _res;

  @override
  call({
    double? rating,
    String? $__typename,
  }) =>
      _res;
}
