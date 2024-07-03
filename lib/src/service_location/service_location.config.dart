// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coolmovies/src/data/data.dart' as _i5;
import 'package:coolmovies/src/data/data_sources/movie_remote_data_source.dart'
    as _i3;
import 'package:coolmovies/src/data/repositories/movie_repository.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.lazySingletonAsync<_i3.MovieRemoteDataSource>(
      () => _i3.MovieRemoteDataSource.init(),
      registerFor: {_prod},
      preResolve: true,
    );
    gh.lazySingleton<_i4.MovieRepository>(
      () => _i4.MovieRepository(gh<_i5.MovieRemoteDataSource>()),
      registerFor: {_prod},
    );
    return this;
  }
}
