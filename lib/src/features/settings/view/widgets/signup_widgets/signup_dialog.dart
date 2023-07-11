import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/home/blocs/blocs.dart';
import 'package:notes_app/src/features/settings/blocs/blocs.dart';
import 'package:notes_app/src/features/settings/view/widgets/auth_text_form_field.dart';
import 'package:notes_app/src/features/settings/view/widgets/widgets.dart';

part 'confirm_password_text_field.dart';
part 'email_text_field.dart';
part 'password_text_field.dart';
part 'signup_button.dart';

class SignupDialog extends StatelessWidget {
  const SignupDialog({required this.constraints, super.key});

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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.78,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: BlocProvider(
                  create: (context) => SignupCubit(
                    authenticationRepository:
                        context.read<AuthenticationRepository>(),
                  ),
                  child: BlocListener<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state.status.isSuccess) {
                        context.pop();
                        context.read<NoteBloc>().add(ClearNotesEvent());
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
                          'Signup',
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
                          height: 10,
                        ),
                        const _ConfirmPasswordTextField(),
                        const SizedBox(
                          height: 15,
                        ),
                        _SignupButton(width: constraints.maxWidth, height: 40),
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
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
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
                          height: 15,
                        ),
                        BlocProvider<LoginCubit>(
                          create: (context) => LoginCubit(
                            authenticationRepository:
                                context.read<AuthenticationRepository>(),
                          ),
                          child: const GoogleLoginButton(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
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
                                    return LoginDialog(
                                      constraints: constraints,
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Login ',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<SignupCubit, SignupState>(
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
              ),
            );
          },
        ),
      ),
    );
  }
}
