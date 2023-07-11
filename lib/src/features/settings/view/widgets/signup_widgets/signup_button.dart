part of 'signup_dialog.dart';

class _SignupButton extends StatelessWidget {
  const _SignupButton({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: !state.isValid ? Colors.grey : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ElevatedButton(
            key: const Key('signup_button'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: !state.isValid
                ? null
                : () => context.read<SignupCubit>().onSignupButtonPressed(),
            child: state.status.isInProgress
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Sign up'),
                    ],
                  )
                : const Text(
                    'Sign up',
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
