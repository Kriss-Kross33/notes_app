import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/home/blocs/blocs.dart';

part 'search_notes_state.dart';

class SearchNotesCubit extends Cubit<SearchNotesState> {
  SearchNotesCubit(this._noteBloc) : super(const SearchNotesState());

  final NoteBloc _noteBloc;

  void onSearchNote(String queryString) {
    emit(state.copyWith(status: SearchStatus.loading));
    if (queryString.isNotEmpty) {
      final filteredNotes = _noteBloc.notes.where((note) {
        final title = note.title.toLowerCase();
        final body = note.body.toLowerCase();

        return title.contains(queryString.toLowerCase()) ||
            body.contains(
              queryString.toLowerCase(),
            );
      }).toList();
      if (filteredNotes.isNotEmpty) {
        emit(
          state.copyWith(
            notes: filteredNotes,
            status: SearchStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            notes: [],
            status: SearchStatus.empty,
          ),
        );
      }
    }
  }
}
