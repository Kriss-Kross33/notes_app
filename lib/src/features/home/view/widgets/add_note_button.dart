import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/core/core.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            35,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-5, 0),
              color: AppTheme.nero.withOpacity(0.4),
              blurRadius: 5,
            ),
          ],
        ),
        child: FloatingActionButton(
          elevation: 5,
          key: const Key('floating_action_button'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: AppTheme.nero,
          onPressed: () {
            context.pushNamed(RouteConsts.editNoteRoute);
          },
          child: Center(
            child: Image.asset(
              AssetConsts.add,
            ),
          ),
        ),
      ),
    );
  }
}
