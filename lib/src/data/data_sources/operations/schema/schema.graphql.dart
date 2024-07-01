class Input$CreateMovieReviewInput {
  factory Input$CreateMovieReviewInput({
    required String title,
    String? body,
    int? rating,
    required String movieId,
    required String userReviewerId,
  }) =>
      Input$CreateMovieReviewInput._({
        r'title': title,
        if (body != null) r'body': body,
        if (rating != null) r'rating': rating,
        r'movieId': movieId,
        r'userReviewerId': userReviewerId,
      });

  Input$CreateMovieReviewInput._(this._$data);

  factory Input$CreateMovieReviewInput.fromJson(Map<String, dynamic> data) {
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
    return Input$CreateMovieReviewInput._(result$data);
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

  CopyWith$Input$CreateMovieReviewInput<Input$CreateMovieReviewInput>
      get copyWith => CopyWith$Input$CreateMovieReviewInput(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CreateMovieReviewInput) ||
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

abstract class CopyWith$Input$CreateMovieReviewInput<TRes> {
  factory CopyWith$Input$CreateMovieReviewInput(
    Input$CreateMovieReviewInput instance,
    TRes Function(Input$CreateMovieReviewInput) then,
  ) = _CopyWithImpl$Input$CreateMovieReviewInput;

  factory CopyWith$Input$CreateMovieReviewInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateMovieReviewInput;

  TRes call({
    String? title,
    String? body,
    int? rating,
    String? movieId,
    String? userReviewerId,
  });
}

class _CopyWithImpl$Input$CreateMovieReviewInput<TRes>
    implements CopyWith$Input$CreateMovieReviewInput<TRes> {
  _CopyWithImpl$Input$CreateMovieReviewInput(
    this._instance,
    this._then,
  );

  final Input$CreateMovieReviewInput _instance;

  final TRes Function(Input$CreateMovieReviewInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? body = _undefined,
    Object? rating = _undefined,
    Object? movieId = _undefined,
    Object? userReviewerId = _undefined,
  }) =>
      _then(Input$CreateMovieReviewInput._({
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

class _CopyWithStubImpl$Input$CreateMovieReviewInput<TRes>
    implements CopyWith$Input$CreateMovieReviewInput<TRes> {
  _CopyWithStubImpl$Input$CreateMovieReviewInput(this._res);

  TRes _res;

  call({
    String? title,
    String? body,
    int? rating,
    String? movieId,
    String? userReviewerId,
  }) =>
      _res;
}

const possibleTypesMap = <String, Set<String>>{};
