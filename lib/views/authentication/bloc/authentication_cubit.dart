import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

enum SocialMedia { google, apple, facebook }

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void logIn({required String email, required String password}) async {
    emit(AuthenticationLoading());

    if (!isClosed) {
      emit(AuthenticationSuccess());
    }
  }
}
