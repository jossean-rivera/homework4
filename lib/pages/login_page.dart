import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework4/blocs/authentication/bloc/authentication_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: FilledButton(
          child: const Text("Log In"),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationLoginEvent());
          },
        ),
      ),
    );
  }
}
