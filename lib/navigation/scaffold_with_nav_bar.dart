import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  final String title;
  const ScaffoldWithNavBar(
      {super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_outlined), label: "By Author"),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined), label: "By Title"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile"),
        ],
        currentIndex: _getCurrentIndex(context),
        onTap: (index) {
          _onTapItem(index, context);
        },
      ),
    );
  }

  _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    if (location.startsWith("/byAuthor")) {
      return 0;
    }

    if (location.startsWith("/byTitle")) {
      return 1;
    }

    if (location.startsWith("/profile")) {
      return 2;
    }

    return 0;
  }
  
  void _onTapItem(int index, BuildContext context) {
    switch (index) {
      case 0: 
        GoRouter.of(context).goNamed(RouteNames.byAuthor);
        break;
      case 1:
        GoRouter.of(context).goNamed(RouteNames.byTitle);
        break;
      case 2:
        GoRouter.of(context).goNamed(RouteNames.profile);
        break;
    }
  }
}
