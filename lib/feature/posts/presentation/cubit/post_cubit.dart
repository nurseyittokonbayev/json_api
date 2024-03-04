import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_api/feature/posts/data/model/models.dart';
import 'package:json_api/feature/posts/domain/usecases/post_usecases.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostdUseCases getPostdUseCases;

  PostCubit({required this.getPostdUseCases}) : super(PostInitial());

  Future<void> fetchPosts() async {
    try {
      final posts = await getPostdUseCases();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      emit(PostError(error: e.toString()));
    }
  }
}
