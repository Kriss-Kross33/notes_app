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
    final date = note.updated ?? note.created;
    final dateTime = DateFormat.yMMMd().add_jm().format(date!);
    return GestureDetector(
      key: Key('note_item_$index'),
      onTap: () => context.pushNamed(RouteConsts.noteDetailRoute, extra: note),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 110,
          minWidth: 500,
          maxHeight: 250,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      note.body,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.darkGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Text(
                    dateTime,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.darkGrey,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
