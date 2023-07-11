part of 'login_dialog.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: !state.isValid ? Colors.grey : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            key: const Key('login_button'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: !state.isValid
                ? null
                : () => context.read<LoginCubit>().onLoginButtonPressed(),
            child: state.status.isInProgress
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(
                        color: Colors.amber,
                      ),
                      SizedBox(width: 8),
                      Text('Login'),
                    ],
                  )
                : const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
