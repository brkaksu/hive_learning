import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_learning/hive/local_storage_manager.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> with LocalStorageManager {
  UserCubit() : super(const UserState());

  Future<void> getUserInfo() async {
    String email = await getItem('email');
    String username = await getItem('username');
    emit(state.copyWith(email: email, username: username));
  }
}
