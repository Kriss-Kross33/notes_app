import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/edit_note/view/widgets/widgets.dart';
import 'package:notes_app/src/features/home/blocs/blocs.dart';

part 'note_item.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({
    required this.notes,
    super.key,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 93, left: 24, right: 24),
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          // final color = notes[index].noteCardColor.toColor();
          const cardColors = AppTheme.cardColors;
          final noteCardColor = cardColors[index % cardColors.length];
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 25,
            ),
            child: Dismissible(
              key: Key(note.id.toString()),
              onDismissed: (direction) {
                context
                    .read<NoteBloc>()
                    .add(DeleteNoteEvent(id: note.id, note: note));
                Fluttertoast.showToast(
                  msg: 'Note deleted succesfully',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: AppTheme.darkGrey,
                  textColor: Colors.white,
                  fontSize: 16,
                );
              },
              direction: DismissDirection.endToStart,
              background: const DismissContainer(),
              child: _NoteItem(
                color: noteCardColor,
                note: note,
              ),
            ),
          );
        },
      ),
    );
  }
}
