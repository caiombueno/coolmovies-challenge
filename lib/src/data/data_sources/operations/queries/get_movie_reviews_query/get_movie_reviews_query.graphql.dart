// ignore_for_file: type=lint
// coverage:ignore-file

import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetMovieReviews {
  factory Variables$Query$GetMovieReviews({required String movieId}) =>
      Variables$Query$GetMovieReviews._({
        r'movieId': movieId,
      });

  Variables$Query$GetMovieReviews._(this._$data);

  factory Variables$Query$GetMovieReviews.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$movieId = data['movieId'];
    result$data['movieId'] = (l$movieId as String);
    return Variables$Query$GetMovieReviews._(result$data);
  }

  Map<String, dynamic> _$data;

  String get movieId => (_$data['movieId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$movieId = movieId;
    result$data['movieId'] = l$movieId;
    return result$data;
  }

  CopyWith$Variables$Query$GetMovieReviews<Variables$Query$GetMovieReviews>
      get copyWith => CopyWith$Variables$Query$GetMovieReviews(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMovieReviews ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$movieId = movieId;
    final lOther$movieId = other.movieId;
    if (l$movieId != lOther$movieId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$movieId = movieId;
    return Object.hashAll([l$movieId]);
  }
}

abstract class CopyWith$Variables$Query$GetMovieReviews<TRes> {
  factory CopyWith$Variables$Query$GetMovieReviews(
    Variables$Query$GetMovieReviews instance,
    TRes Function(Variables$Query$GetMovieReviews) then,
  ) = _CopyWithImpl$Variables$Query$GetMovieReviews;

  factory CopyWith$Variables$Query$GetMovieReviews.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMovieReviews;

  TRes call({String? movieId});
}

class _CopyWithImpl$Variables$Query$GetMovieReviews<TRes>
    implements CopyWith$Variables$Query$GetMovieReviews<TRes> {
  _CopyWithImpl$Variables$Query$GetMovieReviews(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMovieReviews _instance;

  final TRes Function(Variables$Query$GetMovieReviews) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? movieId = _undefined}) =>
      _then(Variables$Query$GetMovieReviews._({
        ..._instance._$data,
        if (movieId != _undefined && movieId != null)
          'movieId': (movieId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMovieReviews<TRes>
    implements CopyWith$Variables$Query$GetMovieReviews<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMovieReviews(this._res);

  final TRes _res;

  @override
  call({String? movieId}) => _res;
}

class Query$GetMovieReviews {
  Query$GetMovieReviews({
    this.movieById,
    this.$__typename = 'Query',
  });

  factory Query$GetMovieReviews.fromJson(Map<String, dynamic> json) {
    final l$movieById = json['movieById'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieReviews(
      movieById: l$movieById == null
          ? null
          : Query$GetMovieReviews$movieById.fromJson(
              (l$movieById as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMovieReviews$movieById? movieById;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$movieById = movieById;
    resultData['movieById'] = l$movieById?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$movieById = movieById;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$movieById,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieReviews || runtimeType != other.runtimeType) {
      return false;
    }
    final l$movieById = movieById;
    final lOther$movieById = other.movieById;
    if (l$movieById != lOther$movieById) {
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

extension UtilityExtension$Query$GetMovieReviews on Query$GetMovieReviews {
  CopyWith$Query$GetMovieReviews<Query$GetMovieReviews> get copyWith =>
      CopyWith$Query$GetMovieReviews(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMovieReviews<TRes> {
  factory CopyWith$Query$GetMovieReviews(
    Query$GetMovieReviews instance,
    TRes Function(Query$GetMovieReviews) then,
  ) = _CopyWithImpl$Query$GetMovieReviews;

  factory CopyWith$Query$GetMovieReviews.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieReviews;

  TRes call({
    Query$GetMovieReviews$movieById? movieById,
    String? $__typename,
  });
  CopyWith$Query$GetMovieReviews$movieById<TRes> get movieById;
}

class _CopyWithImpl$Query$GetMovieReviews<TRes>
    implements CopyWith$Query$GetMovieReviews<TRes> {
  _CopyWithImpl$Query$GetMovieReviews(
    this._instance,
    this._then,
  );

  final Query$GetMovieReviews _instance;

  final TRes Function(Query$GetMovieReviews) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? movieById = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieReviews(
        movieById: movieById == _undefined
            ? _instance.movieById
            : (movieById as Query$GetMovieReviews$movieById?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieReviews$movieById<TRes> get movieById {
    final local$movieById = _instance.movieById;
    return local$movieById == null
        ? CopyWith$Query$GetMovieReviews$movieById.stub(_then(_instance))
        : CopyWith$Query$GetMovieReviews$movieById(
            local$movieById, (e) => call(movieById: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieReviews<TRes>
    implements CopyWith$Query$GetMovieReviews<TRes> {
  _CopyWithStubImpl$Query$GetMovieReviews(this._res);

  final TRes _res;

  @override
  call({
    Query$GetMovieReviews$movieById? movieById,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieReviews$movieById<TRes> get movieById =>
      CopyWith$Query$GetMovieReviews$movieById.stub(_res);
}

const documentNodeQueryGetMovieReviews = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMovieReviews'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'movieId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'movieById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'movieId')),
          )
        ],
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
                    name: NameNode(value: 'body'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'rating'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'userByUserReviewerId'),
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
                        name: NameNode(value: 'name'),
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
Query$GetMovieReviews _parserFn$Query$GetMovieReviews(
        Map<String, dynamic> data) =>
    Query$GetMovieReviews.fromJson(data);
typedef OnQueryComplete$Query$GetMovieReviews = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMovieReviews?,
);

class Options$Query$GetMovieReviews
    extends graphql.QueryOptions<Query$GetMovieReviews> {
  Options$Query$GetMovieReviews({
    String? operationName,
    required Variables$Query$GetMovieReviews variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieReviews? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMovieReviews? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                    _parserFn$Query$GetMovieReviews(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMovieReviews,
          parserFn: _parserFn$Query$GetMovieReviews,
        );

  final OnQueryComplete$Query$GetMovieReviews? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMovieReviews
    extends graphql.WatchQueryOptions<Query$GetMovieReviews> {
  WatchOptions$Query$GetMovieReviews({
    String? operationName,
    required Variables$Query$GetMovieReviews variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieReviews? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMovieReviews,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMovieReviews,
        );
}

class FetchMoreOptions$Query$GetMovieReviews extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMovieReviews({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMovieReviews variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMovieReviews,
        );
}

extension ClientExtension$Query$GetMovieReviews on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMovieReviews>> query$GetMovieReviews(
          Options$Query$GetMovieReviews options) async =>
      await query(options);
  graphql.ObservableQuery<Query$GetMovieReviews> watchQuery$GetMovieReviews(
          WatchOptions$Query$GetMovieReviews options) =>
      watchQuery(options);
  void writeQuery$GetMovieReviews({
    required Query$GetMovieReviews data,
    required Variables$Query$GetMovieReviews variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
              document: documentNodeQueryGetMovieReviews),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMovieReviews? readQuery$GetMovieReviews({
    required Variables$Query$GetMovieReviews variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation:
            const graphql.Operation(document: documentNodeQueryGetMovieReviews),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMovieReviews.fromJson(result);
  }
}

class Query$GetMovieReviews$movieById {
  Query$GetMovieReviews$movieById({
    required this.id,
    this.movieReviewsByMovieId,
    this.$__typename = 'MovieDetails',
  });

  factory Query$GetMovieReviews$movieById.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$movieReviewsByMovieId = json['movieReviewsByMovieId'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieReviews$movieById(
      id: (l$id as String),
      movieReviewsByMovieId: l$movieReviewsByMovieId == null
          ? null
          : Query$GetMovieReviews$movieById$movieReviewsByMovieId.fromJson(
              (l$movieReviewsByMovieId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetMovieReviews$movieById$movieReviewsByMovieId?
      movieReviewsByMovieId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    resultData['movieReviewsByMovieId'] = l$movieReviewsByMovieId?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$movieReviewsByMovieId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieReviews$movieById ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetMovieReviews$movieById
    on Query$GetMovieReviews$movieById {
  CopyWith$Query$GetMovieReviews$movieById<Query$GetMovieReviews$movieById>
      get copyWith => CopyWith$Query$GetMovieReviews$movieById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieReviews$movieById<TRes> {
  factory CopyWith$Query$GetMovieReviews$movieById(
    Query$GetMovieReviews$movieById instance,
    TRes Function(Query$GetMovieReviews$movieById) then,
  ) = _CopyWithImpl$Query$GetMovieReviews$movieById;

  factory CopyWith$Query$GetMovieReviews$movieById.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieReviews$movieById;

  TRes call({
    String? id,
    Query$GetMovieReviews$movieById$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  });
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId;
}

class _CopyWithImpl$Query$GetMovieReviews$movieById<TRes>
    implements CopyWith$Query$GetMovieReviews$movieById<TRes> {
  _CopyWithImpl$Query$GetMovieReviews$movieById(
    this._instance,
    this._then,
  );

  final Query$GetMovieReviews$movieById _instance;

  final TRes Function(Query$GetMovieReviews$movieById) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? movieReviewsByMovieId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieReviews$movieById(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        movieReviewsByMovieId: movieReviewsByMovieId == _undefined
            ? _instance.movieReviewsByMovieId
            : (movieReviewsByMovieId
                as Query$GetMovieReviews$movieById$movieReviewsByMovieId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId {
    final local$movieReviewsByMovieId = _instance.movieReviewsByMovieId;
    return local$movieReviewsByMovieId == null
        ? CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId.stub(
            _then(_instance))
        : CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId(
            local$movieReviewsByMovieId, (e) => call(movieReviewsByMovieId: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieReviews$movieById<TRes>
    implements CopyWith$Query$GetMovieReviews$movieById<TRes> {
  _CopyWithStubImpl$Query$GetMovieReviews$movieById(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    Query$GetMovieReviews$movieById$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId =>
          CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId.stub(
              _res);
}

class Query$GetMovieReviews$movieById$movieReviewsByMovieId {
  Query$GetMovieReviews$movieById$movieReviewsByMovieId({
    required this.nodes,
    this.$__typename = 'MovieReviewConnection',
  });

  factory Query$GetMovieReviews$movieById$movieReviewsByMovieId.fromJson(
      Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieReviews$movieById$movieReviewsByMovieId(
      nodes: (l$nodes as List<dynamic>)
          .map((e) =>
              Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes> nodes;

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
    if (other is! Query$GetMovieReviews$movieById$movieReviewsByMovieId ||
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

extension UtilityExtension$Query$GetMovieReviews$movieById$movieReviewsByMovieId
    on Query$GetMovieReviews$movieById$movieReviewsByMovieId {
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<
          Query$GetMovieReviews$movieById$movieReviewsByMovieId>
      get copyWith =>
          CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<
    TRes> {
  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId(
    Query$GetMovieReviews$movieById$movieReviewsByMovieId instance,
    TRes Function(Query$GetMovieReviews$movieById$movieReviewsByMovieId) then,
  ) = _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId;

  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId;

  TRes call({
    List<Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes> Function(
              Iterable<
                  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
                      Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>>)
          fn);
}

class _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes> {
  _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId(
    this._instance,
    this._then,
  );

  final Query$GetMovieReviews$movieById$movieReviewsByMovieId _instance;

  final TRes Function(Query$GetMovieReviews$movieById$movieReviewsByMovieId)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieReviews$movieById$movieReviewsByMovieId(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<
                Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes nodes(
          Iterable<Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes> Function(
                  Iterable<
                      CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
                          Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>>)
              fn) =>
      call(
          nodes: fn(_instance.nodes.map((e) =>
              CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId<
        TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId<TRes> {
  _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId(
      this._res);

  final TRes _res;

  @override
  call({
    List<Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>? nodes,
    String? $__typename,
  }) =>
      _res;

  @override
  nodes(fn) => _res;
}

class Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes {
  Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes({
    required this.id,
    this.title,
    this.body,
    this.rating,
    this.userByUserReviewerId,
    this.$__typename = 'MovieReview',
  });

  factory Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$rating = json['rating'];
    final l$userByUserReviewerId = json['userByUserReviewerId'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
      id: (l$id as String),
      title: (l$title as String?),
      body: (l$body as String?),
      rating: (l$rating as num?)?.toDouble(),
      userByUserReviewerId: l$userByUserReviewerId == null
          ? null
          : Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
              .fromJson((l$userByUserReviewerId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? body;

  final double? rating;

  final Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
      userByUserReviewerId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$title = title;
    resultData['title'] = l$title;
    final l$body = body;
    resultData['body'] = l$body;
    final l$rating = rating;
    resultData['rating'] = l$rating;
    final l$userByUserReviewerId = userByUserReviewerId;
    resultData['userByUserReviewerId'] = l$userByUserReviewerId?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$body = body;
    final l$rating = rating;
    final l$userByUserReviewerId = userByUserReviewerId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$body,
      l$rating,
      l$userByUserReviewerId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes ||
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
    final l$body = body;
    final lOther$body = other.body;
    if (l$body != lOther$body) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$userByUserReviewerId = userByUserReviewerId;
    final lOther$userByUserReviewerId = other.userByUserReviewerId;
    if (l$userByUserReviewerId != lOther$userByUserReviewerId) {
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

extension UtilityExtension$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes
    on Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes {
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
          Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes>
      get copyWith =>
          CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
    TRes> {
  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
    Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes instance,
    TRes Function(Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes)
        then,
  ) = _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes;

  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes;

  TRes call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  });
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
      TRes> get userByUserReviewerId;
}

class _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
    this._instance,
    this._then,
  );

  final Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes _instance;

  final TRes Function(
      Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? body = _undefined,
    Object? rating = _undefined,
    Object? userByUserReviewerId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        body: body == _undefined ? _instance.body : (body as String?),
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        userByUserReviewerId: userByUserReviewerId == _undefined
            ? _instance.userByUserReviewerId
            : (userByUserReviewerId
                as Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
      TRes> get userByUserReviewerId {
    final local$userByUserReviewerId = _instance.userByUserReviewerId;
    return local$userByUserReviewerId == null
        ? CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
            .stub(_then(_instance))
        : CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
            local$userByUserReviewerId, (e) => call(userByUserReviewerId: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes(
      this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
          TRes>
      get userByUserReviewerId =>
          CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
              .stub(_res);
}

class Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId {
  Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId({
    required this.id,
    this.name,
    this.$__typename = 'User',
  });

  factory Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
      id: (l$id as String),
      name: (l$name as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$name = name;
    resultData['name'] = l$name;
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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

extension UtilityExtension$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
    on Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId {
  CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
          Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId>
      get copyWith =>
          CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
    TRes> {
  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
    Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
        instance,
    TRes Function(
            Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId)
        then,
  ) = _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId;

  factory CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
            TRes> {
  _CopyWithImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
    this._instance,
    this._then,
  );

  final Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
      _instance;

  final TRes Function(
          Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieReviews$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
      this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
