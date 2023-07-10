import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/features.dart';

/// {@template app_router}
/// A Class which manages routing in the notes app.
/// {@endtemplate}
class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      //* Settings Route
      GoRoute(
        path: RouteConsts.splashRoute,
        name: RouteConsts.splashRoute,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashScreen(),
          );
        },
      ),
      //* Home
      GoRoute(
        path: RouteConsts.homeRoute,
        name: RouteConsts.homeRoute,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomeScreen(),
          );
        },
        routes: <RouteBase>[
          //* Edit notes Route
          GoRoute(
            path: RouteConsts.editNoteRoute,
            name: RouteConsts.editNoteRoute,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: EditNoteScreen(
                  note: state.extra as Note?,
                ),
              );
            },
          ),
          //* Note details Route
          GoRoute(
            path: RouteConsts.noteDetailRoute,
            name: RouteConsts.noteDetailRoute,
            pageBuilder: (context, state) {
              return MaterialPage(
                child: NoteDetailScreen(
                  note: state.extra! as Note,
                ),
              );
            },
          ),
          //* Search note Route
          GoRoute(
            path: RouteConsts.searchNoteRoute,
            name: RouteConsts.searchNoteRoute,
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const SearchNoteScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            ),
          ),
          //* Settings Route
          GoRoute(
            path: RouteConsts.settingsRoute,
            name: RouteConsts.settingsRoute,
            pageBuilder: (context, state) {
              return const MaterialPage(
                child: SettingsScreen(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
