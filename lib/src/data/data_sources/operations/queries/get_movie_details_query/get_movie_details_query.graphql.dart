// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetMovieDetails {
  factory Variables$Query$GetMovieDetails({required String id}) =>
      Variables$Query$GetMovieDetails._({
        r'id': id,
      });

  Variables$Query$GetMovieDetails._(this._$data);

  factory Variables$Query$GetMovieDetails.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetMovieDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetMovieDetails<Variables$Query$GetMovieDetails>
      get copyWith => CopyWith$Variables$Query$GetMovieDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMovieDetails ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetMovieDetails<TRes> {
  factory CopyWith$Variables$Query$GetMovieDetails(
    Variables$Query$GetMovieDetails instance,
    TRes Function(Variables$Query$GetMovieDetails) then,
  ) = _CopyWithImpl$Variables$Query$GetMovieDetails;

  factory CopyWith$Variables$Query$GetMovieDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMovieDetails;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetMovieDetails<TRes>
    implements CopyWith$Variables$Query$GetMovieDetails<TRes> {
  _CopyWithImpl$Variables$Query$GetMovieDetails(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMovieDetails _instance;

  final TRes Function(Variables$Query$GetMovieDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetMovieDetails._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMovieDetails<TRes>
    implements CopyWith$Variables$Query$GetMovieDetails<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMovieDetails(this._res);

  final TRes _res;

  @override
  call({String? id}) => _res;
}

class Query$GetMovieDetails {
  Query$GetMovieDetails({
    this.movieById,
    this.$__typename = 'Query',
  });

  factory Query$GetMovieDetails.fromJson(Map<String, dynamic> json) {
    final l$movieById = json['movieById'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails(
      movieById: l$movieById == null
          ? null
          : Query$GetMovieDetails$movieById.fromJson(
              (l$movieById as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMovieDetails$movieById? movieById;

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
    if (other is! Query$GetMovieDetails || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetMovieDetails on Query$GetMovieDetails {
  CopyWith$Query$GetMovieDetails<Query$GetMovieDetails> get copyWith =>
      CopyWith$Query$GetMovieDetails(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMovieDetails<TRes> {
  factory CopyWith$Query$GetMovieDetails(
    Query$GetMovieDetails instance,
    TRes Function(Query$GetMovieDetails) then,
  ) = _CopyWithImpl$Query$GetMovieDetails;

  factory CopyWith$Query$GetMovieDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails;

  TRes call({
    Query$GetMovieDetails$movieById? movieById,
    String? $__typename,
  });
  CopyWith$Query$GetMovieDetails$movieById<TRes> get movieById;
}

class _CopyWithImpl$Query$GetMovieDetails<TRes>
    implements CopyWith$Query$GetMovieDetails<TRes> {
  _CopyWithImpl$Query$GetMovieDetails(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails _instance;

  final TRes Function(Query$GetMovieDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? movieById = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieDetails(
        movieById: movieById == _undefined
            ? _instance.movieById
            : (movieById as Query$GetMovieDetails$movieById?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieDetails$movieById<TRes> get movieById {
    final local$movieById = _instance.movieById;
    return local$movieById == null
        ? CopyWith$Query$GetMovieDetails$movieById.stub(_then(_instance))
        : CopyWith$Query$GetMovieDetails$movieById(
            local$movieById, (e) => call(movieById: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieDetails<TRes>
    implements CopyWith$Query$GetMovieDetails<TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails(this._res);

  final TRes _res;

  @override
  call({
    Query$GetMovieDetails$movieById? movieById,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieDetails$movieById<TRes> get movieById =>
      CopyWith$Query$GetMovieDetails$movieById.stub(_res);
}

const documentNodeQueryGetMovieDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMovieDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
            value: VariableNode(name: NameNode(value: 'id')),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'releaseDate'),
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
            name: NameNode(value: 'movieDirectorByMovieDirectorId'),
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
Query$GetMovieDetails _parserFn$Query$GetMovieDetails(
        Map<String, dynamic> data) =>
    Query$GetMovieDetails.fromJson(data);
typedef OnQueryComplete$Query$GetMovieDetails = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMovieDetails?,
);

class Options$Query$GetMovieDetails
    extends graphql.QueryOptions<Query$GetMovieDetails> {
  Options$Query$GetMovieDetails({
    String? operationName,
    required Variables$Query$GetMovieDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieDetails? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMovieDetails? onComplete,
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
                    _parserFn$Query$GetMovieDetails(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMovieDetails,
          parserFn: _parserFn$Query$GetMovieDetails,
        );

  final OnQueryComplete$Query$GetMovieDetails? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMovieDetails
    extends graphql.WatchQueryOptions<Query$GetMovieDetails> {
  WatchOptions$Query$GetMovieDetails({
    String? operationName,
    required Variables$Query$GetMovieDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMovieDetails? typedOptimisticResult,
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
          document: documentNodeQueryGetMovieDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMovieDetails,
        );
}

class FetchMoreOptions$Query$GetMovieDetails extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMovieDetails({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMovieDetails variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMovieDetails,
        );
}

extension ClientExtension$Query$GetMovieDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMovieDetails>> query$GetMovieDetails(
          Options$Query$GetMovieDetails options) async =>
      await query(options);
  graphql.ObservableQuery<Query$GetMovieDetails> watchQuery$GetMovieDetails(
          WatchOptions$Query$GetMovieDetails options) =>
      watchQuery(options);
  void writeQuery$GetMovieDetails({
    required Query$GetMovieDetails data,
    required Variables$Query$GetMovieDetails variables,
    bool broadcast = true,
  }) =>
      writeQuery(
        graphql.Request(
          operation: const graphql.Operation(
              document: documentNodeQueryGetMovieDetails),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMovieDetails? readQuery$GetMovieDetails({
    required Variables$Query$GetMovieDetails variables,
    bool optimistic = true,
  }) {
    final result = readQuery(
      graphql.Request(
        operation:
            const graphql.Operation(document: documentNodeQueryGetMovieDetails),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMovieDetails.fromJson(result);
  }
}

class Query$GetMovieDetails$movieById {
  Query$GetMovieDetails$movieById({
    required this.id,
    this.title,
    this.releaseDate,
    this.imgUrl,
    this.movieDirectorByMovieDirectorId,
    this.movieReviewsByMovieId,
    this.$__typename = 'Movie',
  });

  factory Query$GetMovieDetails$movieById.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$releaseDate = json['releaseDate'];
    final l$imgUrl = json['imgUrl'];
    final l$movieDirectorByMovieDirectorId =
        json['movieDirectorByMovieDirectorId'];
    final l$movieReviewsByMovieId = json['movieReviewsByMovieId'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails$movieById(
      id: (l$id as String),
      title: (l$title as String?),
      releaseDate: (l$releaseDate as String?),
      imgUrl: (l$imgUrl as String?),
      movieDirectorByMovieDirectorId: l$movieDirectorByMovieDirectorId == null
          ? null
          : Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId
              .fromJson(
                  (l$movieDirectorByMovieDirectorId as Map<String, dynamic>)),
      movieReviewsByMovieId: l$movieReviewsByMovieId == null
          ? null
          : Query$GetMovieDetails$movieById$movieReviewsByMovieId.fromJson(
              (l$movieReviewsByMovieId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? releaseDate;

  final String? imgUrl;

  final Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId?
      movieDirectorByMovieDirectorId;

  final Query$GetMovieDetails$movieById$movieReviewsByMovieId?
      movieReviewsByMovieId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$id = id;
    resultData['id'] = l$id;
    final l$title = title;
    resultData['title'] = l$title;
    final l$releaseDate = releaseDate;
    resultData['releaseDate'] = l$releaseDate;
    final l$imgUrl = imgUrl;
    resultData['imgUrl'] = l$imgUrl;
    final l$movieDirectorByMovieDirectorId = movieDirectorByMovieDirectorId;
    resultData['movieDirectorByMovieDirectorId'] =
        l$movieDirectorByMovieDirectorId?.toJson();
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
    final l$releaseDate = releaseDate;
    final l$imgUrl = imgUrl;
    final l$movieDirectorByMovieDirectorId = movieDirectorByMovieDirectorId;
    final l$movieReviewsByMovieId = movieReviewsByMovieId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$releaseDate,
      l$imgUrl,
      l$movieDirectorByMovieDirectorId,
      l$movieReviewsByMovieId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMovieDetails$movieById ||
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
    final l$releaseDate = releaseDate;
    final lOther$releaseDate = other.releaseDate;
    if (l$releaseDate != lOther$releaseDate) {
      return false;
    }
    final l$imgUrl = imgUrl;
    final lOther$imgUrl = other.imgUrl;
    if (l$imgUrl != lOther$imgUrl) {
      return false;
    }
    final l$movieDirectorByMovieDirectorId = movieDirectorByMovieDirectorId;
    final lOther$movieDirectorByMovieDirectorId =
        other.movieDirectorByMovieDirectorId;
    if (l$movieDirectorByMovieDirectorId !=
        lOther$movieDirectorByMovieDirectorId) {
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

extension UtilityExtension$Query$GetMovieDetails$movieById
    on Query$GetMovieDetails$movieById {
  CopyWith$Query$GetMovieDetails$movieById<Query$GetMovieDetails$movieById>
      get copyWith => CopyWith$Query$GetMovieDetails$movieById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieDetails$movieById<TRes> {
  factory CopyWith$Query$GetMovieDetails$movieById(
    Query$GetMovieDetails$movieById instance,
    TRes Function(Query$GetMovieDetails$movieById) then,
  ) = _CopyWithImpl$Query$GetMovieDetails$movieById;

  factory CopyWith$Query$GetMovieDetails$movieById.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails$movieById;

  TRes call({
    String? id,
    String? title,
    String? releaseDate,
    String? imgUrl,
    Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId?
        movieDirectorByMovieDirectorId,
    Query$GetMovieDetails$movieById$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  });
  CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<TRes>
      get movieDirectorByMovieDirectorId;
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId;
}

class _CopyWithImpl$Query$GetMovieDetails$movieById<TRes>
    implements CopyWith$Query$GetMovieDetails$movieById<TRes> {
  _CopyWithImpl$Query$GetMovieDetails$movieById(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails$movieById _instance;

  final TRes Function(Query$GetMovieDetails$movieById) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? releaseDate = _undefined,
    Object? imgUrl = _undefined,
    Object? movieDirectorByMovieDirectorId = _undefined,
    Object? movieReviewsByMovieId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieDetails$movieById(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        releaseDate: releaseDate == _undefined
            ? _instance.releaseDate
            : (releaseDate as String?),
        imgUrl: imgUrl == _undefined ? _instance.imgUrl : (imgUrl as String?),
        movieDirectorByMovieDirectorId: movieDirectorByMovieDirectorId ==
                _undefined
            ? _instance.movieDirectorByMovieDirectorId
            : (movieDirectorByMovieDirectorId
                as Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId?),
        movieReviewsByMovieId: movieReviewsByMovieId == _undefined
            ? _instance.movieReviewsByMovieId
            : (movieReviewsByMovieId
                as Query$GetMovieDetails$movieById$movieReviewsByMovieId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<TRes>
      get movieDirectorByMovieDirectorId {
    final local$movieDirectorByMovieDirectorId =
        _instance.movieDirectorByMovieDirectorId;
    return local$movieDirectorByMovieDirectorId == null
        ? CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId
            .stub(_then(_instance))
        : CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
            local$movieDirectorByMovieDirectorId,
            (e) => call(movieDirectorByMovieDirectorId: e));
  }

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId {
    final local$movieReviewsByMovieId = _instance.movieReviewsByMovieId;
    return local$movieReviewsByMovieId == null
        ? CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId.stub(
            _then(_instance))
        : CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId(
            local$movieReviewsByMovieId, (e) => call(movieReviewsByMovieId: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieDetails$movieById<TRes>
    implements CopyWith$Query$GetMovieDetails$movieById<TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails$movieById(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? title,
    String? releaseDate,
    String? imgUrl,
    Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId?
        movieDirectorByMovieDirectorId,
    Query$GetMovieDetails$movieById$movieReviewsByMovieId?
        movieReviewsByMovieId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<TRes>
      get movieDirectorByMovieDirectorId =>
          CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId
              .stub(_res);

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes>
      get movieReviewsByMovieId =>
          CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId.stub(
              _res);
}

class Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId {
  Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId({
    required this.id,
    this.name,
    this.$__typename = 'MovieDirector',
  });

  factory Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
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
            is! Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId ||
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

extension UtilityExtension$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId
    on Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId {
  CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
          Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId>
      get copyWith =>
          CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
    TRes> {
  factory CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
    Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId instance,
    TRes Function(
            Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId)
        then,
  ) = _CopyWithImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId;

  factory CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
            TRes> {
  _CopyWithImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId
      _instance;

  final TRes Function(
      Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieDirectorByMovieDirectorId(
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

class Query$GetMovieDetails$movieById$movieReviewsByMovieId {
  Query$GetMovieDetails$movieById$movieReviewsByMovieId({
    required this.nodes,
    this.$__typename = 'MovieReviewConnection',
  });

  factory Query$GetMovieDetails$movieById$movieReviewsByMovieId.fromJson(
      Map<String, dynamic> json) {
    final l$nodes = json['nodes'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails$movieById$movieReviewsByMovieId(
      nodes: (l$nodes as List<dynamic>)
          .map((e) =>
              Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes> nodes;

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
    if (other is! Query$GetMovieDetails$movieById$movieReviewsByMovieId ||
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

extension UtilityExtension$Query$GetMovieDetails$movieById$movieReviewsByMovieId
    on Query$GetMovieDetails$movieById$movieReviewsByMovieId {
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<
          Query$GetMovieDetails$movieById$movieReviewsByMovieId>
      get copyWith =>
          CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<
    TRes> {
  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId(
    Query$GetMovieDetails$movieById$movieReviewsByMovieId instance,
    TRes Function(Query$GetMovieDetails$movieById$movieReviewsByMovieId) then,
  ) = _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId;

  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId;

  TRes call({
    List<Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>? nodes,
    String? $__typename,
  });
  TRes nodes(
      Iterable<Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes> Function(
              Iterable<
                  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
                      Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>>)
          fn);
}

class _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes> {
  _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails$movieById$movieReviewsByMovieId _instance;

  final TRes Function(Query$GetMovieDetails$movieById$movieReviewsByMovieId)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? nodes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMovieDetails$movieById$movieReviewsByMovieId(
        nodes: nodes == _undefined || nodes == null
            ? _instance.nodes
            : (nodes as List<
                Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  TRes nodes(
          Iterable<Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes> Function(
                  Iterable<
                      CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
                          Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>>)
              fn) =>
      call(
          nodes: fn(_instance.nodes.map((e) =>
              CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId<TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId(
      this._res);

  final TRes _res;

  @override
  call({
    List<Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>? nodes,
    String? $__typename,
  }) =>
      _res;

  @override
  nodes(fn) => _res;
}

class Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes {
  Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes({
    required this.id,
    this.title,
    this.body,
    this.rating,
    this.userByUserReviewerId,
    this.$__typename = 'MovieReview',
  });

  factory Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$rating = json['rating'];
    final l$userByUserReviewerId = json['userByUserReviewerId'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
      id: (l$id as String),
      title: (l$title as String?),
      body: (l$body as String?),
      rating: (l$rating as num?)?.toDouble(),
      userByUserReviewerId: l$userByUserReviewerId == null
          ? null
          : Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
              .fromJson((l$userByUserReviewerId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? body;

  final double? rating;

  final Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
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
    if (other is! Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes ||
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

extension UtilityExtension$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes
    on Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes {
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
          Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes>
      get copyWith =>
          CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
    TRes> {
  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
    Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes instance,
    TRes Function(Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes)
        then,
  ) = _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes;

  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes;

  TRes call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  });
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
      TRes> get userByUserReviewerId;
}

class _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes _instance;

  final TRes Function(
      Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes) _then;

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
      _then(Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        body: body == _undefined ? _instance.body : (body as String?),
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        userByUserReviewerId: userByUserReviewerId == _undefined
            ? _instance.userByUserReviewerId
            : (userByUserReviewerId
                as Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
      TRes> get userByUserReviewerId {
    final local$userByUserReviewerId = _instance.userByUserReviewerId;
    return local$userByUserReviewerId == null
        ? CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
            .stub(_then(_instance))
        : CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
            local$userByUserReviewerId, (e) => call(userByUserReviewerId: e));
  }
}

class _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes(
      this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
          TRes>
      get userByUserReviewerId =>
          CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
              .stub(_res);
}

class Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId {
  Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId({
    required this.id,
    this.name,
    this.$__typename = 'User',
  });

  factory Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
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
            is! Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId ||
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

extension UtilityExtension$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
    on Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId {
  CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
          Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId>
      get copyWith =>
          CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
    TRes> {
  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
    Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
        instance,
    TRes Function(
            Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId)
        then,
  ) = _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId;

  factory CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
            TRes> {
  _CopyWithImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
    this._instance,
    this._then,
  );

  final Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId
      _instance;

  final TRes Function(
          Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId<
            TRes> {
  _CopyWithStubImpl$Query$GetMovieDetails$movieById$movieReviewsByMovieId$nodes$userByUserReviewerId(
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
