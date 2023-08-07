import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api/api/api.dart';
import 'package:json_api/models/models.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Post> posts = [];
  final dio = Dio();

  void postData() async {
    try {
      final res = await dio.get('${ApiConst.baseUrl}/posts');
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data as List<dynamic>;

        List<Post> fetchedPosts = data.map((posts) {
          return Post(title: posts['title'], body: posts['body']);
        }).toList();

        setState(() {
          posts = fetchedPosts;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: posts.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(post.body),
                );
              }),
    );
  }
}
