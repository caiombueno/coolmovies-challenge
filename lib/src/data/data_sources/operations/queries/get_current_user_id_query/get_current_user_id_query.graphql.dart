// ignore_for_file: type=lint
// coverage:ignore-file

import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Query$GetCurrentUser {
  Query$GetCurrentUser({
    this.currentUser,
    this.$__typename = 'Query',
  });

  factory Query$GetCurrentUser.fromJson(Map<String, dynamic> json) {
    final l$currentUser = json['currentUser'];
    final l$$__typename = json['__typename'];
    return Query$GetCurrentUser(
      currentUser: l$currentUser == null
          ? null
          : Query$GetCurrentUser$currentUser.fromJson(
              (l$currentUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCurrentUser$currentUser? currentUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final resultData = <String, dynamic>{};
    final l$currentUser = currentUser;
    resultData['currentUser'] = l$currentUser?.toJson();
    final l$$__typename = $__typename;
    resultData['__typename'] = l$$__typename;
    return resultData;
  }

  @override
  int get hashCode {
    final l$currentUser = currentUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$currentUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCurrentUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$currentUser = currentUser;
    final lOther$currentUser = other.currentUser;
    if (l$currentUser != lOther$currentUser) {
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

extension UtilityExtension$Query$GetCurrentUser on Query$GetCurrentUser {
  CopyWith$Query$GetCurrentUser<Query$GetCurrentUser> get copyWith =>
      CopyWith$Query$GetCurrentUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetCurrentUser<TRes> {
  factory CopyWith$Query$GetCurrentUser(
    Query$GetCurrentUser instance,
    TRes Function(Query$GetCurrentUser) then,
  ) = _CopyWithImpl$Query$GetCurrentUser;

  factory CopyWith$Query$GetCurrentUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCurrentUser;

  TRes call({
    Query$GetCurrentUser$currentUser? currentUser,
    String? $__typename,
  });
  CopyWith$Query$GetCurrentUser$currentUser<TRes> get currentUser;
}

class _CopyWithImpl$Query$GetCurrentUser<TRes>
    implements CopyWith$Query$GetCurrentUser<TRes> {
  _CopyWithImpl$Query$GetCurrentUser(
    this._instance,
    this._then,
  );

  final Query$GetCurrentUser _instance;

  final TRes Function(Query$GetCurrentUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? currentUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCurrentUser(
        currentUser: currentUser == _undefined
            ? _instance.currentUser
            : (currentUser as Query$GetCurrentUser$currentUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  @override
  CopyWith$Query$GetCurrentUser$currentUser<TRes> get currentUser {
    final local$currentUser = _instance.currentUser;
    return local$currentUser == null
        ? CopyWith$Query$GetCurrentUser$currentUser.stub(_then(_instance))
        : CopyWith$Query$GetCurrentUser$currentUser(
            local$currentUser, (e) => call(currentUser: e));
  }
}

class _CopyWithStubImpl$Query$GetCurrentUser<TRes>
    implements CopyWith$Query$GetCurrentUser<TRes> {
  _CopyWithStubImpl$Query$GetCurrentUser(this._res);

  final TRes _res;

  @override
  call({
    Query$GetCurrentUser$currentUser? currentUser,
    String? $__typename,
  }) =>
      _res;

  @override
  CopyWith$Query$GetCurrentUser$currentUser<TRes> get currentUser =>
      CopyWith$Query$GetCurrentUser$currentUser.stub(_res);
}

const documentNodeQueryGetCurrentUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCurrentUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'currentUser'),
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
]);
Query$GetCurrentUser _parserFn$Query$GetCurrentUser(
        Map<String, dynamic> data) =>
    Query$GetCurrentUser.fromJson(data);
typedef OnQueryComplete$Query$GetCurrentUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetCurrentUser?,
);

class Options$Query$GetCurrentUser
    extends graphql.QueryOptions<Query$GetCurrentUser> {
  Options$Query$GetCurrentUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCurrentUser? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetCurrentUser? onComplete,
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
                    _parserFn$Query$GetCurrentUser(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetCurrentUser,
          parserFn: _parserFn$Query$GetCurrentUser,
        );

  final OnQueryComplete$Query$GetCurrentUser? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetCurrentUser
    extends graphql.WatchQueryOptions<Query$GetCurrentUser> {
  WatchOptions$Query$GetCurrentUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCurrentUser? typedOptimisticResult,
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
          document: documentNodeQueryGetCurrentUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetCurrentUser,
        );
}

class FetchMoreOptions$Query$GetCurrentUser extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCurrentUser(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetCurrentUser,
        );
}

extension ClientExtension$Query$GetCurrentUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCurrentUser>> query$GetCurrentUser(
          [Options$Query$GetCurrentUser? options]) async =>
      await query(options ?? Options$Query$GetCurrentUser());
  graphql.ObservableQuery<Query$GetCurrentUser> watchQuery$GetCurrentUser(
          [WatchOptions$Query$GetCurrentUser? options]) =>
      watchQuery(options ?? WatchOptions$Query$GetCurrentUser());
  void writeQuery$GetCurrentUser({
    required Query$GetCurrentUser data,
    bool broadcast = true,
  }) =>
      writeQuery(
        const graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetCurrentUser)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetCurrentUser? readQuery$GetCurrentUser({bool optimistic = true}) {
    final result = readQuery(
      const graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetCurrentUser)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetCurrentUser.fromJson(result);
  }
}

class Query$GetCurrentUser$currentUser {
  Query$GetCurrentUser$currentUser({
    required this.id,
    this.name,
    this.$__typename = 'User',
  });

  factory Query$GetCurrentUser$currentUser.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetCurrentUser$currentUser(
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
    if (other is! Query$GetCurrentUser$currentUser ||
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

extension UtilityExtension$Query$GetCurrentUser$currentUser
    on Query$GetCurrentUser$currentUser {
  CopyWith$Query$GetCurrentUser$currentUser<Query$GetCurrentUser$currentUser>
      get copyWith => CopyWith$Query$GetCurrentUser$currentUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCurrentUser$currentUser<TRes> {
  factory CopyWith$Query$GetCurrentUser$currentUser(
    Query$GetCurrentUser$currentUser instance,
    TRes Function(Query$GetCurrentUser$currentUser) then,
  ) = _CopyWithImpl$Query$GetCurrentUser$currentUser;

  factory CopyWith$Query$GetCurrentUser$currentUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCurrentUser$currentUser;

  TRes call({
    String? id,
    String? name,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCurrentUser$currentUser<TRes>
    implements CopyWith$Query$GetCurrentUser$currentUser<TRes> {
  _CopyWithImpl$Query$GetCurrentUser$currentUser(
    this._instance,
    this._then,
  );

  final Query$GetCurrentUser$currentUser _instance;

  final TRes Function(Query$GetCurrentUser$currentUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  @override
  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCurrentUser$currentUser(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined ? _instance.name : (name as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCurrentUser$currentUser<TRes>
    implements CopyWith$Query$GetCurrentUser$currentUser<TRes> {
  _CopyWithStubImpl$Query$GetCurrentUser$currentUser(this._res);

  final TRes _res;

  @override
  call({
    String? id,
    String? name,
    String? $__typename,
  }) =>
      _res;
}
