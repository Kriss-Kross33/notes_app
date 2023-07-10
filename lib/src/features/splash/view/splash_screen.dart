import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/core/core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    checkForSignup();
    _timer = Timer(const Duration(seconds: 3), () {
      context.pushReplacementNamed(RouteConsts.homeRoute);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> checkForSignup() async {
    final userLoggedIn = context.read<AuthenticationRepository>().isLoggedIn();
    if (!userLoggedIn) {
      await context.read<AuthenticationRepository>().signInAnonymously();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetConsts.notesLogo,
              height: 90,
              width: 90,
            ),
          ],
        ),
      ),
    );
  }
}
