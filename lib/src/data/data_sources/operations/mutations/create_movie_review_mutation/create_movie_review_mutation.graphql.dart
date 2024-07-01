// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Mutation$CreateMovieReview {
  factory Variables$Mutation$CreateMovieReview({
    required String title,
    String? body,
    int? rating,
    required String movieId,
    required String userReviewerId,
  }) =>
      Variables$Mutation$CreateMovieReview._({
        r'title': title,
        if (body != null) r'body': body,
        if (rating != null) r'rating': rating,
        r'movieId': movieId,
        r'userReviewerId': userReviewerId,
      });

  Variables$Mutation$CreateMovieReview._(this._$data);

  factory Variables$Mutation$CreateMovieReview.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('body')) {
      final l$body = data['body'];
      result$data['body'] = (l$body as String?);
    }
    if (data.containsKey('rating')) {
      final l$rating = data['rating'];
      result$data['rating'] = (l$rating as int?);
    }
    final l$movieId = data['movieId'];
    result$data['movieId'] = (l$movieId as String);
    final l$userReviewerId = data['userReviewerId'];
    result$data['userReviewerId'] = (l$userReviewerId as String);
    return Variables$Mutation$CreateMovieReview._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String? get body => (_$data['body'] as String?);

  int? get rating => (_$data['rating'] as int?);

  String get movieId => (_$data['movieId'] as String);

  String get userReviewerId => (_$data['userReviewerId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    if (_$data.containsKey('body')) {
      final l$body = body;
      result$data['body'] = l$body;
    }
    if (_$data.containsKey('rating')) {
      final l$rating = rating;
      result$data['rating'] = l$rating;
    }
    final l$movieId = movieId;
    result$data['movieId'] = l$movieId;
    final l$userReviewerId = userReviewerId;
    result$data['userReviewerId'] = l$userReviewerId;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateMovieReview<
          Variables$Mutation$CreateMovieReview>
      get copyWith => CopyWith$Variables$Mutation$CreateMovieReview(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateMovieReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$body = body;
    final lOther$body = other.body;
    if (_$data.containsKey('body') != other._$data.containsKey('body')) {
      return false;
    }
    if (l$body != lOther$body) {
      return false;
    }
    final l$rating = rating;
    final lOther$rating = other.rating;
    if (_$data.containsKey('rating') != other._$data.containsKey('rating')) {
      return false;
    }
    if (l$rating != lOther$rating) {
      return false;
    }
    final l$movieId = movieId;
    final lOther$movieId = other.movieId;
    if (l$movieId != lOther$movieId) {
      return false;
    }
    final l$userReviewerId = userReviewerId;
    final lOther$userReviewerId = other.userReviewerId;
    if (l$userReviewerId != lOther$userReviewerId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$body = body;
    final l$rating = rating;
    final l$movieId = movieId;
    final l$userReviewerId = userReviewerId;
    return Object.hashAll([
      l$title,
      _$data.containsKey('body') ? l$body : const {},
      _$data.containsKey('rating') ? l$rating : const {},
      l$movieId,
      l$userReviewerId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateMovieReview<TRes> {
  factory CopyWith$Variables$Mutation$CreateMovieReview(
    Variables$Mutation$CreateMovieReview instance,
    TRes Function(Variables$Mutation$CreateMovieReview) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateMovieReview;

  factory CopyWith$Variables$Mutation$CreateMovieReview.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateMovieReview;

  TRes call({
    String? title,
    String? body,
    int? rating,
    String? movieId,
    String? userReviewerId,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateMovieReview<TRes>
    implements CopyWith$Variables$Mutation$CreateMovieReview<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateMovieReview(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateMovieReview _instance;

  final TRes Function(Variables$Mutation$CreateMovieReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? title = _undefined,
    Object? body = _undefined,
    Object? rating = _undefined,
    Object? movieId = _undefined,
    Object? userReviewerId = _undefined,
  }) =>
      _then(Variables$Mutation$CreateMovieReview._({
        ..._instance._$data,
        if (title != _undefined && title != null) 'title': (title as String),
        if (body != _undefined) 'body': (body as String?),
        if (rating != _undefined) 'rating': (rating as int?),
        if (movieId != _undefined && movieId != null)
          'movieId': (movieId as String),
        if (userReviewerId != _undefined && userReviewerId != null)
          'userReviewerId': (userReviewerId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateMovieReview<TRes>
    implements CopyWith$Variables$Mutation$CreateMovieReview<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateMovieReview(this._res);

  final TRes _res;

  @override
  call({
    String? title,
    String? body,
    int? rating,
    String? movieId,
    String? userReviewerId,
  }) =>
      _res;
}

class Mutation$CreateMovieReview {
  Mutation$CreateMovieReview({
    this.createMovieReview,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateMovieReview.fromJson(Map<String, dynamic> json) {
    final l$createMovieReview = json['createMovieReview'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMovieReview(
      createMovieReview: l$createMovieReview == null
          ? null
          : Mutation$CreateMovieReview$createMovieReview.fromJson(
              (l$createMovieReview as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMovieReview$createMovieReview? createMovieReview;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$createMovieReview = createMovieReview;
    resultData['createMovieReview'] = l$createMovieReview?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$createMovieReview = createMovieReview;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createMovieReview,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMovieReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMovieReview = createMovieReview;
    final lOther$createMovieReview = other.createMovieReview;
    if (l$createMovieReview != lOther$createMovieReview) {
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

extension UtilityExtension$Mutation$CreateMovieReview
    on Mutation$CreateMovieReview {
  CopyWith$Mutation$CreateMovieReview<Mutation$CreateMovieReview>
      get copyWith => CopyWith$Mutation$CreateMovieReview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMovieReview<TRes> {
  factory CopyWith$Mutation$CreateMovieReview(
    Mutation$CreateMovieReview instance,
    TRes Function(Mutation$CreateMovieReview) then,
  ) = _CopyWithImpl$Mutation$CreateMovieReview;

  factory CopyWith$Mutation$CreateMovieReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMovieReview;

  TRes call({
    Mutation$CreateMovieReview$createMovieReview? createMovieReview,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes>
      get createMovieReview;
}

class _CopyWithImpl$Mutation$CreateMovieReview<TRes>
    implements CopyWith$Mutation$CreateMovieReview<TRes> {
  _CopyWithImpl$Mutation$CreateMovieReview(
    this._instance,
    this._then,
  );

  final Mutation$CreateMovieReview _instance;

  final TRes Function(Mutation$CreateMovieReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? createMovieReview = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateMovieReview(
        createMovieReview: createMovieReview == _undefined
            ? _instance.createMovieReview
            : (createMovieReview
                as Mutation$CreateMovieReview$createMovieReview?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes>
      get createMovieReview {
    final local$createMovieReview = _instance.createMovieReview;
    return local$createMovieReview == null
        ? CopyWith$Mutation$CreateMovieReview$createMovieReview.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateMovieReview$createMovieReview(
            local$createMovieReview, (e) => call(createMovieReview: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateMovieReview<TRes>
    implements CopyWith$Mutation$CreateMovieReview<TRes> {
  _CopyWithStubImpl$Mutation$CreateMovieReview(this._res);

  final TRes _res;

  @override
  call({
    Mutation$CreateMovieReview$createMovieReview? createMovieReview,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes>
      get createMovieReview =>
          CopyWith$Mutation$CreateMovieReview$createMovieReview.stub(_res);
}

const documentNodeMutationCreateMovieReview = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateMovieReview'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'body')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'rating')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'movieId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userReviewerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'UUID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createMovieReview'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'movieReview'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'title'),
                    value: VariableNode(name: NameNode(value: 'title')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'body'),
                    value: VariableNode(name: NameNode(value: 'body')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'rating'),
                    value: VariableNode(name: NameNode(value: 'rating')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'movieId'),
                    value: VariableNode(name: NameNode(value: 'movieId')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'userReviewerId'),
                    value:
                        VariableNode(name: NameNode(value: 'userReviewerId')),
                  ),
                ]),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'movieReview'),
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
]);
Mutation$CreateMovieReview _parserFn$Mutation$CreateMovieReview(
        Map<String, dynamic> data) =>
    Mutation$CreateMovieReview.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateMovieReview = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateMovieReview?,
);

class Options$Mutation$CreateMovieReview
    extends graphql.MutationOptions<Mutation$CreateMovieReview> {
  Options$Mutation$CreateMovieReview({
    String? operationName,
    required Variables$Mutation$CreateMovieReview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMovieReview? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMovieReview? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMovieReview>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$CreateMovieReview(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateMovieReview,
          parserFn: _parserFn$Mutation$CreateMovieReview,
        );

  final OnMutationCompleted$Mutation$CreateMovieReview? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateMovieReview
    extends graphql.WatchQueryOptions<Mutation$CreateMovieReview> {
  WatchOptions$Mutation$CreateMovieReview({
    String? operationName,
    required Variables$Mutation$CreateMovieReview variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMovieReview? typedOptimisticResult,
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
          document: documentNodeMutationCreateMovieReview,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateMovieReview,
        );
}

extension ClientExtension$Mutation$CreateMovieReview on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateMovieReview>>
      mutate$CreateMovieReview(
              Options$Mutation$CreateMovieReview options) async =>
          await mutate(options);
  graphql.ObservableQuery<Mutation$CreateMovieReview>
      watchMutation$CreateMovieReview(
              WatchOptions$Mutation$CreateMovieReview options) =>
          watchMutation(options);
}

class Mutation$CreateMovieReview$createMovieReview {
  Mutation$CreateMovieReview$createMovieReview({
    this.movieReview,
    this.$__typename = 'CreateMovieReviewPayload',
  });

  factory Mutation$CreateMovieReview$createMovieReview.fromJson(
      Map<String, dynamic> json) {
    final l$movieReview = json['movieReview'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMovieReview$createMovieReview(
      movieReview: l$movieReview == null
          ? null
          : Mutation$CreateMovieReview$createMovieReview$movieReview.fromJson(
              (l$movieReview as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMovieReview$createMovieReview$movieReview? movieReview;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$movieReview = movieReview;
    resultData['movieReview'] = l$movieReview?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$movieReview = movieReview;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$movieReview,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMovieReview$createMovieReview ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$movieReview = movieReview;
    final lOther$movieReview = other.movieReview;
    if (l$movieReview != lOther$movieReview) {
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

extension UtilityExtension$Mutation$CreateMovieReview$createMovieReview
    on Mutation$CreateMovieReview$createMovieReview {
  CopyWith$Mutation$CreateMovieReview$createMovieReview<
          Mutation$CreateMovieReview$createMovieReview>
      get copyWith => CopyWith$Mutation$CreateMovieReview$createMovieReview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes> {
  factory CopyWith$Mutation$CreateMovieReview$createMovieReview(
    Mutation$CreateMovieReview$createMovieReview instance,
    TRes Function(Mutation$CreateMovieReview$createMovieReview) then,
  ) = _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview;

  factory CopyWith$Mutation$CreateMovieReview$createMovieReview.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview;

  TRes call({
    Mutation$CreateMovieReview$createMovieReview$movieReview? movieReview,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<TRes>
      get movieReview;
}

class _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview<TRes>
    implements CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes> {
  _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview(
    this._instance,
    this._then,
  );

  final Mutation$CreateMovieReview$createMovieReview _instance;

  final TRes Function(Mutation$CreateMovieReview$createMovieReview) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? movieReview = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateMovieReview$createMovieReview(
        movieReview: movieReview == _undefined
            ? _instance.movieReview
            : (movieReview
                as Mutation$CreateMovieReview$createMovieReview$movieReview?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<TRes>
      get movieReview {
    final local$movieReview = _instance.movieReview;
    return local$movieReview == null
        ? CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview
            .stub(_then(_instance))
        : CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview(
            local$movieReview, (e) => call(movieReview: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview<TRes>
    implements CopyWith$Mutation$CreateMovieReview$createMovieReview<TRes> {
  _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview(this._res);

  final TRes _res;

  @override
  call({
    Mutation$CreateMovieReview$createMovieReview$movieReview? movieReview,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<TRes>
      get movieReview =>
          CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview
              .stub(_res);
}

class Mutation$CreateMovieReview$createMovieReview$movieReview {
  Mutation$CreateMovieReview$createMovieReview$movieReview({
    required this.id,
    this.title,
    this.body,
    this.rating,
    this.userByUserReviewerId,
    this.$__typename = 'MovieReview',
  });

  factory Mutation$CreateMovieReview$createMovieReview$movieReview.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$body = json['body'];
    final l$rating = json['rating'];
    final l$userByUserReviewerId = json['userByUserReviewerId'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMovieReview$createMovieReview$movieReview(
      id: (l$id as String),
      title: (l$title as String?),
      body: (l$body as String?),
      rating: (l$rating as num?)?.toDouble(),
      userByUserReviewerId: l$userByUserReviewerId == null
          ? null
          : Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
              .fromJson((l$userByUserReviewerId as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? title;

  final String? body;

  final double? rating;

  final Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId?
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
    if (other is! Mutation$CreateMovieReview$createMovieReview$movieReview ||
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

extension UtilityExtension$Mutation$CreateMovieReview$createMovieReview$movieReview
    on Mutation$CreateMovieReview$createMovieReview$movieReview {
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<
          Mutation$CreateMovieReview$createMovieReview$movieReview>
      get copyWith =>
          CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<
    TRes> {
  factory CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview(
    Mutation$CreateMovieReview$createMovieReview$movieReview instance,
    TRes Function(Mutation$CreateMovieReview$createMovieReview$movieReview)
        then,
  ) = _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview;

  factory CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview;

  TRes call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
      TRes> get userByUserReviewerId;
}

class _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview<
        TRes>
    implements
        CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<
            TRes> {
  _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview(
    this._instance,
    this._then,
  );

  final Mutation$CreateMovieReview$createMovieReview$movieReview _instance;

  final TRes Function(Mutation$CreateMovieReview$createMovieReview$movieReview)
      _then;

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
      _then(Mutation$CreateMovieReview$createMovieReview$movieReview(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined ? _instance.title : (title as String?),
        body: body == _undefined ? _instance.body : (body as String?),
        rating: rating == _undefined ? _instance.rating : (rating as double?),
        userByUserReviewerId: userByUserReviewerId == _undefined
            ? _instance.userByUserReviewerId
            : (userByUserReviewerId
                as Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
      TRes> get userByUserReviewerId {
    final local$userByUserReviewerId = _instance.userByUserReviewerId;
    return local$userByUserReviewerId == null
        ? CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
            .stub(_then(_instance))
        : CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
            local$userByUserReviewerId, (e) => call(userByUserReviewerId: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview<
        TRes>
    implements
        CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview(
      this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? title,
    String? body,
    double? rating,
    Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId?
        userByUserReviewerId,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
          TRes>
      get userByUserReviewerId =>
          CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
              .stub(_res);
}

class Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId {
  Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId({
    required this.id,
    this.name,
    this.$__typename = 'User',
  });

  factory Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
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
            is! Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId ||
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

extension UtilityExtension$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
    on Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId {
  CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
          Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId>
      get copyWith =>
          CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
    TRes> {
  factory CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
    Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
        instance,
    TRes Function(
            Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId)
        then,
  ) = _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId;

  factory CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
            TRes> {
  _CopyWithImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
    this._instance,
    this._then,
  );

  final Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId
      _instance;

  final TRes Function(
          Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
        TRes>
    implements
        CopyWith$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateMovieReview$createMovieReview$movieReview$userByUserReviewerId(
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
