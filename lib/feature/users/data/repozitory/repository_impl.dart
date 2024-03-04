import 'package:json_api/core/error.dart';
import 'package:json_api/feature/users/data/datasourses/remote_post_datasoursec.dart';
import 'package:json_api/feature/users/data/model/user_models.dart';
import 'package:json_api/feature/users/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final RemoteUsersDataSources remoteUsersDataSources;

  UserRepoImpl({required this.remoteUsersDataSources});

  @override
  Future<List<UserModels>> getUsers() async {
    try {
      List<UserModels> users = await remoteUsersDataSources.getUsers();
      return users;
    } catch (e) {
      throw ServerException();
    }
  }
}
