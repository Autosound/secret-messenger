// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_app/domain/usecase/check_homeserver_usecase.dart';
import 'package:matrix_app/domain/usecase/login_usecase.dart';
import '../../global_state.dart';
import 'auth_cubit_states.dart';

class AuthCubit extends Cubit<AuthState> with CheckHomeServerUsecase, LoginUsecase {
  AuthCubit() : super(AuthIdle());

  void authenticate({required String homeserver, required String email, required String password}) async {
    emit(AuthLoading());
    try {
      globalState.homeServerSummary = await checkHomeServerUsecase(homeServerUrl: homeserver);
      globalState.loginResponse = await loginUsecase(email: email, password: password);
      emit(AuthSuccess());
    } catch (error) {
      emit(AuthError(error: '$error'));
    }
  }
}



