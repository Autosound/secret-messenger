import 'package:matrix_app/presentation/authentication/auth_cubit.dart';
import 'package:matrix_app/presentation/chat_list/chat_list_cubit.dart';

class GetIt {
  GetIt._();

  static final GetIt _instance = GetIt._();

  factory GetIt() => _instance;


  //Singletons
  static AuthCubit authCubit = AuthCubit();
  static ChatListCubit chatListCubit = ChatListCubit();


  //Lazy singletons
  AuthCubit? _authCubitLazy;
  AuthCubit authCubitLazy() {
    if (_authCubitLazy == null) {
      _authCubitLazy = AuthCubit();
      return _authCubitLazy!;
    } else {
      return _authCubitLazy!;
    }
  }


  //Factory
  AuthCubit authCubitFactory() => AuthCubit();
}
