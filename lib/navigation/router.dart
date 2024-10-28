import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homework4/navigation/route_names.dart';
import 'package:homework4/navigation/scaffold_with_nav_bar.dart';
import 'package:homework4/pages/by_author_detail_page.dart';
import 'package:homework4/pages/by_author_page.dart';
import 'package:homework4/pages/by_title_detail_page.dart';
import 'package:homework4/pages/by_title_page.dart';
import 'package:homework4/pages/login_page.dart';
import 'package:homework4/pages/profile_page.dart';
import 'package:homework4/utilities/stream_to_listenable.dart';

import '../blocs/authentication/bloc/authentication_bloc.dart';

// Keys for showing/hiding the bottom bar
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Root");
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Shell");

GoRouter createRouter(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) {
      //  Check if the current bloc state is for logging out
      if (authenticationBloc.state is AuthenticationLoggedOut) {
        //  If the user is not on the login page, then redirect the user to /login
        if (state.fullPath?.startsWith("/login") == true) {
          return "/login";
        }
      } else if (authenticationBloc.state is AuthenticationLoggedIn) {

        //  If the event for logging in raise, and the user is in the login page, 
        //  then redirect to the home page
        if (state.fullPath?.startsWith("/logging") == true){
          return "/byAuthor";
        }
      }

      //  Default to login page
      return "/login";
    },
    navigatorKey: rootNavigatorKey, // root navigator key
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithNavBar(title: "temp", child: child),
        routes: [
          GoRoute(
            path: "/byAuthor",
            name: RouteNames.byAuthor,
            builder: (context, state) => const ByAuthorPage(),
            routes: [
              GoRoute(
                path: "detail",
                name: RouteNames.byAuthorDetail,
                parentNavigatorKey: rootNavigatorKey, // Push to root navigator
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
                parentNavigatorKey: rootNavigatorKey, // Push to root navigator
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
    ],
  );
}
