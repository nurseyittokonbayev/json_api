import 'package:json_api/core/error.dart';
import 'package:json_api/core/network/api_provider.dart';
import 'package:json_api/feature/users/data/model/user_models.dart';

abstract class RemoteUsersDataSources {
  Future<List<UserModels>> getUsers();
}

class RemoteUsersDataSourcesImpl implements RemoteUsersDataSources {
  final ApiProvider apiProvider;

  RemoteUsersDataSourcesImpl({required this.apiProvider});

  @override
  Future<List<UserModels>> getUsers() async {
    try {
      final response = await apiProvider.fetchData('/users');

      return (response['data'] as List<dynamic>)
          .map((json) => UserModels.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException('Ошибка при выполнении getPosts(): $e');
    }
  }
}
