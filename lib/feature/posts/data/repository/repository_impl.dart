import 'package:json_api/feature/posts/data/datasources/remote_post_datasources.dart';
import 'package:json_api/feature/posts/data/model/models.dart';
import 'package:json_api/feature/posts/domain/repository/repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemotePostDataSources remotePostDataSources;

  PostRepositoryImpl({required this.remotePostDataSources});

  @override
  Future<List<Post>> getPosts() async {
    try {
      List<Post> posts = await remotePostDataSources.getPosts();
      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
