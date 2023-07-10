part of 'login_widgets/login_dialog.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.pop();
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
              onPressed: () =>
                  context.read<LoginCubit>().onLoginWithGoogleButtonPressed(),
              child: state.status.isInProgress
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CupertinoActivityIndicator(
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CachedNetworkImage(
                          imageUrl:
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                          width: 30,
                          height: 30,
                          errorWidget: (
                            context,
                            _,
                            __,
                          ) {
                            return const Icon(
                              FontAwesomeIcons.google,
                              color: Colors.redAccent,
                            );
                          },
                        ),
                      ],
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                      width: 30,
                      height: 30,
                      errorWidget: (
                        context,
                        _,
                        __,
                      ) {
                        return const Icon(
                          FontAwesomeIcons.google,
                          color: Colors.redAccent,
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
