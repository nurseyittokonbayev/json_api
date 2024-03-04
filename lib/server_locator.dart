import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:json_api/core/network/api_provider.dart';
import 'package:json_api/feature/posts/data/datasources/remote_post_datasources.dart';
import 'package:json_api/feature/posts/data/repository/repository_impl.dart';
import 'package:json_api/feature/posts/domain/repository/repository.dart';
import 'package:json_api/feature/posts/domain/usecases/post_usecases.dart';
import 'package:json_api/feature/posts/presentation/cubit/post_cubit.dart';
import 'package:json_api/feature/users/data/datasourses/remote_post_datasoursec.dart';
import 'package:json_api/feature/users/data/repozitory/repository_impl.dart';
import 'package:json_api/feature/users/domain/repository/user_repo.dart';
import 'package:json_api/feature/users/domain/usecases/user_usecases.dart';
import 'package:json_api/feature/users/presentation/cubit/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // CUBIT (BLOC)
  sl.registerFactory(
    () => PostCubit(
      getPostdUseCases: sl<GetPostdUseCases>(),
    ),
  );
  sl.registerFactory(
    () => UserCubit(
      userUseCases: sl<GetUserUseCases>(),
    ),
  );
  sl.registerLazySingleton<ApiProvider>(() => ApiProvider());

  // USECASES
  sl.registerLazySingleton(() => GetPostdUseCases(repository: sl()));
  sl.registerLazySingleton(() => GetUserUseCases(userRepo: sl()));

  // EXTERNAL
  sl.registerLazySingleton<Dio>(() => Dio());

  // REPOSITORIES
  sl.registerLazySingleton<RemotePostDataSources>(
    () => RemotePostDataSourcesImpl(apiProvider: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remotePostDataSources: sl()),
  );
  sl.registerLazySingleton<RemoteUsersDataSources>(
    () => RemoteUsersDataSourcesImpl(apiProvider: sl()),
  );
  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(remoteUsersDataSources: sl()),
  );
}
