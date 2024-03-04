import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_api/feature/posts/presentation/cubit/post_cubit.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostLoaded) {
              return ListView.builder(
                  itemCount: state.posts!.length,
                  itemBuilder: (context, index) {
                    final post = state.posts![index];
                    return Card(
                      child: ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      ),
                    );
                  });
            } else if (state is PostError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
