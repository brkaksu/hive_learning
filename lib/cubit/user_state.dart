// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  final String? email;
  final String? username;

  const UserState({
    this.email,
    this.username,
  });

  @override
  List<Object?> get props => [email, username];

  @override
  bool get stringify => true;

  UserState copyWith({
    String? email,
    String? username,
  }) {
    return UserState(
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}
