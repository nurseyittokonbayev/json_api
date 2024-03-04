import 'package:json_api/feature/posts/data/model/models.dart';
import 'package:json_api/feature/posts/domain/repository/repository.dart';

class GetPostdUseCases {
  final PostRepository repository;

  GetPostdUseCases({required this.repository});

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}
