import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_api/feature/users/data/model/user_models.dart';
import 'package:json_api/feature/users/domain/usecases/user_usecases.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUseCases userUseCases;
  UserCubit({required this.userUseCases}) : super(UserInitial());

  Future<void> fetchUsers() async {
    try {
      final users = await userUseCases();
      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }
}
