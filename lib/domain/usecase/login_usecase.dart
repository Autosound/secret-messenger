import 'package:matrix/matrix.dart';
import 'package:matrix_app/services/matrix.dart';

mixin class LoginUsecase {
  Future<LoginResponse> loginUsecase({required String email, required String password}) async {
    LoginResponse response = await MatrixService.client.login(
      LoginType.mLoginPassword,
      identifier: AuthenticationThirdPartyIdentifier(medium: 'email', address: email),
      password: password,
    );
    return response;
  }
}
