import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';

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
            context.goNamed(RouteNames.byAuthor);
          },
        ),
      ),
    );
  }
}
