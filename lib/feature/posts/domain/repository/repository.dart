import 'package:json_api/feature/posts/data/model/models.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
