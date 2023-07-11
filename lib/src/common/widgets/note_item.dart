part of 'note_list_widget.dart';

class _NoteItem extends StatelessWidget {
  const _NoteItem({
    required this.color,
    required this.note,
    required this.index,
  });

  final Color color;
  final Note note;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('note_item_$index'),
      onTap: () => context.pushNamed(RouteConsts.noteDetailRoute, extra: note),
      child: Container(
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ),
        width: double.infinity,
        height: 110,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            note.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1,
              fontSize: 23,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
