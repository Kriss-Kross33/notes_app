import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/settings/view/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAnonymous =
        context.read<AuthenticationRepository>().currentUser?.isAnonymous ??
            false;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.unauthenticated) {
              // context.goNamed(RouteConsts.homeRoute);
              // context.read<NoteBloc>().add(ClearNotesEvent());
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppTheme.darkGrey,
                    ),
                    child: Center(
                      child: Text(
                        'Sign in to access your notes from any device',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      if (state.status == AuthenticationStatus.authenticated &&
                          !isAnonymous) {
                        return SizedBox(
                          child: ListTile(
                            title: Text(
                              'Sign out',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            trailing: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            onTap: () {
                              context
                                  .read<AuthenticationBloc>()
                                  .add(const LogoutRequestedEvent());
                            },
                          ),
                        );
                      }
                      return Theme(
                        data: ThemeData(
                          dialogBackgroundColor: AppTheme.nero,
                        ),
                        child: Builder(
                          builder: (context) {
                            return ListTile(
                              title: Text(
                                'Sign in',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              trailing: const Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return LoginDialog(
                                      constraints: constraints,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: AppTheme.darkGrey,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
