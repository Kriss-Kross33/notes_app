import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';

class NoteDetailMenuRow extends StatelessWidget {
  const NoteDetailMenuRow({
    required this.note,
    super.key,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: ThemeData(dialogBackgroundColor: AppTheme.nero),
          child: Builder(
            builder: (context) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.darkGrey,
                  ),
                  child: Image.asset(
                    AssetConsts.arrowBack,
                  ),
                ),
              );
            },
          ),
        ),
        const Spacer(),
        Theme(
          data: ThemeData(dialogBackgroundColor: AppTheme.nero),
          child: Builder(
            builder: (context) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  context.pushNamed(RouteConsts.editNoteRoute, extra: note);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppTheme.darkGrey,
                  ),
                  child: Image.asset(
                    AssetConsts.edit,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
