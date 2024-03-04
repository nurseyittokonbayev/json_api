part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final List<UserModels> users;

  UserLoaded({required this.users});
}

final class UserError extends UserState {
  final String error;

  UserError({required this.error});
}
