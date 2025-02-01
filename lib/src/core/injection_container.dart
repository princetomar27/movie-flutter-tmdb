import 'package:fluttetapi/src/features/movie/data/datasource/movie_datasource.dart';
import 'package:fluttetapi/src/features/movie/data/repository/movie_repository.dart';
import 'package:get_it/get_it.dart';
import '../features/authentication/data/datasource/authentication_datasource.dart';
import '../features/authentication/data/repository/authentication_repository.dart';
import '../features/authentication/presentation/cubit/authentication_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Register datasource
  sl.registerLazySingleton<AuthenticationDatasource>(
      () => AuthenticationDatasourceImpl());
  sl.registerLazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSource());

  // Register repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepository(
      sl(),
    ),
  );

  // Register Cubit
  sl.registerFactory(() => AuthenticationCubit(repository: sl()));
}
