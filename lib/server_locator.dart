import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:json_api/feature/posts/data/datasources/remote_post_datasources.dart';
import 'package:json_api/feature/posts/data/repository/repository_impl.dart';
import 'package:json_api/feature/posts/domain/repository/repository.dart';
import 'package:json_api/feature/posts/domain/usecases/post_usecases.dart';
import 'package:json_api/feature/posts/presentation/cubit/post_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // CUBIT (BLOC)
  sl.registerFactory(
    () => PostCubit(
      getPostdUseCases:
          sl<GetPostdUseCases>(), // Use sl<GetPostdUseCases>() here
    ),
  );

  // USECASES
  sl.registerLazySingleton(() => GetPostdUseCases(repository: sl()));

  // EXTERNAL
  sl.registerLazySingleton<Dio>(() => Dio());

  // REPOSITORIES
  sl.registerLazySingleton<RemotePostDataSources>(
    () => RemotePostDataSourcesImpl(dio: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remotePostDataSources: sl()),
  );
}
