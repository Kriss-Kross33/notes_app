part of 'login_dialog.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return AuthTextFormField(
          key: const Key('login_email_field'),
          hintText: 'Enter email',
          errorText: state.email.displayError != null ? 'invalid email' : null,
          onChanged: (String emailString) =>
              context.read<LoginCubit>().onEmailInput(emailString),
        );
      },
    );
  }
}
