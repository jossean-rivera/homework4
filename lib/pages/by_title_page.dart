import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("By Title"),
      ),
      body: Center(
        child: FilledButton(
          child: const Text("Go to Title Detail"),
          onPressed: () {
            context.goNamed(RouteNames.byTitleDetail);
          },
        ),
      ),
    );
  }
}