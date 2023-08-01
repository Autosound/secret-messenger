import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:matrix_app/presentation/authentication/widgets/homeserver_textfield_widget.dart';
import 'package:matrix_app/presentation/authentication/widgets/login_button_widget.dart';
import 'package:matrix_app/presentation/authentication/widgets/password_textfield_widget.dart';
import 'widgets/email_textfield_widget.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeServerTextController = useTextEditingController();
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Authentication', style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Form(
            child: Builder(builder: (context) {
              return Column(
                children: [
                  const SizedBox(height: 8),
                  HomeserverTextField(controller: homeServerTextController),
                  const SizedBox(height: 8),
                  EmailTextField(controller: emailTextController),
                  const SizedBox(height: 8),
                  PasswordTextField(controller: passwordTextController),
                  const SizedBox(height: 8),
                  LoginButton(
                    homeserver: homeServerTextController,
                    email: emailTextController,
                    password: passwordTextController,
                  )
                ],
              );
            }),
          ),
        ));
  }
}
