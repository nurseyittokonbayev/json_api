import 'package:dio/dio.dart';
import 'package:json_api/core/error.dart';
import 'package:json_api/feature/posts/data/model/models.dart';

abstract class RemotePostDataSources {
  Future<List<Post>> getPosts();
}

class RemotePostDataSourcesImpl implements RemotePostDataSources {
  final Dio dio;

  RemotePostDataSourcesImpl({required this.dio});

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((json) => Post.fromJson(json))
            .toList();
      }
      throw ServerException();
    } catch (e) {
      // Изменено: бросаем исключение с информацией об ошибке
      throw ServerException('Ошибка при выполнении getPosts(): $e');
    }
  }
}
