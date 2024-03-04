import 'package:json_api/feature/users/data/model/user_models.dart';

abstract class UserRepo {
  Future<List<UserModels>> getUsers();
}
