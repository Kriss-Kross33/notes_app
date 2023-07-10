import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class EmptyNoteWidget extends StatelessWidget {
  const EmptyNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AssetConsts.empty,
        ),
        const Text(
          'Create your first note !',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
