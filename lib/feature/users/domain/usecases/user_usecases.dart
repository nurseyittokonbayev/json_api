// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_api/feature/users/data/model/user_models.dart';
import 'package:json_api/feature/users/domain/repository/user_repo.dart';

class GetUserUseCases {
  UserRepo userRepo;
  GetUserUseCases({
    required this.userRepo,
  });

  Future<List<UserModels>> call() async {
    return await userRepo.getUsers();
  }
}
