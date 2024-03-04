import 'package:dio/dio.dart';
import 'package:json_api/core/error.dart';
import 'package:json_api/core/network/api_provider.dart';
import 'package:json_api/feature/posts/data/model/models.dart';

abstract class RemotePostDataSources {
  Future<List<Post>> getPosts();
}

class RemotePostDataSourcesImpl implements RemotePostDataSources {
  final ApiProvider apiProvider;

  RemotePostDataSourcesImpl({required this.apiProvider});

  @override
  Future<List<Post>> getPosts() async {
    try {
      final rawData = await apiProvider.fetchData('/posts');
      return (rawData['data'] as List<dynamic>)
          .map((json) => Post.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException('Ошибка при выполнении getPosts(): $e');
    }
  }
}
