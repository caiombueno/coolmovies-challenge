// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coolmovies/src/data/data_sources/data_sources.dart' as _i6;
import 'package:coolmovies/src/data/data_sources/movie_data_source.dart' as _i3;
import 'package:coolmovies/src/data/repositories/movie_repository.dart' as _i5;
import 'package:coolmovies/src/features/movie_list/state_management/movie_list_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.MovieDataSource>(
        () => _i3.MovieDataSource(gh<_i4.GraphQLClient>()));
    gh.lazySingleton<_i5.MovieRepository>(
        () => _i5.MovieRepository(gh<_i6.MovieDataSource>()));
    gh.lazySingleton<_i7.MovieListCubit>(
      () => _i7.MovieListCubit(gh<_i5.MovieRepository>()),
      dispose: (i) => i.close(),
    );
    return this;
  }
}
