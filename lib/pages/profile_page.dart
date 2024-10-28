import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: FilledButton(
          child: const Text("Log Out"),
          onPressed: () {
            context.goNamed(RouteNames.login);
          },
        ),
      ),
    );
  }
}
