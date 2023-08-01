import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_app/service_locator.dart';
import 'package:matrix_app/presentation/authentication/auth_cubit.dart';
import 'package:matrix_app/presentation/authentication/auth_cubit_states.dart';
import 'package:matrix_app/presentation/chat_list/chat_list_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController homeserver;
  final TextEditingController email;
  final TextEditingController password;

  const LoginButton({
    Key? key,
    required this.homeserver,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (Form.of(context).validate()) {
          GetIt.authCubit.authenticate(
            homeserver: homeserver.text,
            email: email.text,
            password: password.text,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        elevation: 8,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: BlocConsumer<AuthCubit, AuthState>(
        bloc: GetIt.authCubit,
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthSuccess){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatListScreen()));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else {
            return const Text('Sing In', style: TextStyle(color: Colors.white));
          }
        },
      ),
    );
  }
}
