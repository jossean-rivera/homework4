import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';
import 'package:homework4/navigation/scaffold_with_nav_bar.dart';
import 'package:homework4/pages/by_author_detail_page.dart';
import 'package:homework4/pages/by_author_page.dart';
import 'package:homework4/pages/by_title_detail_page.dart';
import 'package:homework4/pages/by_title_page.dart';
import 'package:homework4/pages/login_page.dart';
import 'package:homework4/pages/profile_page.dart';

final router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) => ScaffoldWithNavBar(title: "temp", child: child),
    routes: [
      GoRoute(
        path: "/byAuthor",
        name: RouteNames.byAuthor,
        builder: (context, state) => const ByAuthorPage(),
        routes: [
          GoRoute(
            path: "detail",
            name: RouteNames.byAuthorDetail,
            builder: (context, state) => const ByAuthorDetailPage(),
          ),
        ],
      ),
      GoRoute(
        path: "/byTitle",
        name: RouteNames.byTitle,
        builder: (context, state) => const ByTitlePage(),
        routes: [
          GoRoute(
            path: "detail",
            name: RouteNames.byTitleDetail,
            builder: (context, state) => const ByTitleDetailPage(),
          ),
        ],
      ),
      GoRoute(
        path: "/profile",
        name: RouteNames.profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  ),
  GoRoute(
    path: "/login",
    name: RouteNames.login,
    builder: (context, state) => const LoginPage(),
  ),
]);
