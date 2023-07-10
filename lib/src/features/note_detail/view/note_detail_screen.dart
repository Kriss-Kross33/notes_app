import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/note_detail/view/widgets/widgets.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({required this.note, super.key});

  final Note note;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late String? created;
  late String? updated;

  @override
  void initState() {
    super.initState();
    created = DateFormat.yMMMMEEEEd().add_jm().format(widget.note.created!);
    if (widget.note.updated != null) {
      updated = DateFormat.yMMMMEEEEd().add_jm().format(widget.note.updated!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            NoteDetailMenuRow(
              note: widget.note,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    Text(
                      widget.note.title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.note.body,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: widget.note.updated != null
                          ? Text('Updated: $created')
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Created: $created'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
