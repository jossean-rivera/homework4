import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("By Author"),
      ),
      body: Center(
        child: FilledButton(
          child: const Text("Go to Author Detail"),
          onPressed: () {
            context.goNamed(RouteNames.byAuthorDetail);
          },
        ),
      ),
    );
  }
}