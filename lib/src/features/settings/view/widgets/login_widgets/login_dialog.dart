import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/features.dart';
import 'package:notes_app/src/features/settings/blocs/blocs.dart';
import 'package:notes_app/src/features/settings/view/widgets/auth_text_form_field.dart';
import 'package:notes_app/src/features/settings/view/widgets/widgets.dart';

part '../google_login_button.dart';
part 'email_text_field.dart';
part 'login_button.dart';
part 'password_text_field.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({required this.constraints, super.key});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.nero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.7,
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: BlocProvider(
              create: (context) => LoginCubit(
                authenticationRepository:
                    context.read<AuthenticationRepository>(),
              ),
              child: BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status.isSuccess) {
                    context.pop();
                    context.read<NoteBloc>().add(ClearNotesEvent());
                    context.read<NoteBloc>().add(FetchNotesEvent());
                  }
                },
                child: Column(
                  children: [
                    Image.asset(
                      AssetConsts.notesLogo,
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const _EmailTextField(),
                    const SizedBox(
                      height: 10,
                    ),
                    const _PasswordTextField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _LoginButton(width: constraints.maxWidth, height: 40),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.white54,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const GoogleLoginButton(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return SignupDialog(
                                  constraints: constraints,
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Create one',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        if (state.status.isFailure) {
                          return Text(
                            '${state.errorMessage}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
