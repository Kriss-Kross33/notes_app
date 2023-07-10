part of 'search_notes_cubit.dart';

enum SearchStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

extension SearchStatusExt on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;
  bool get isLoading => this == SearchStatus.loading;
  bool get isSuccess => this == SearchStatus.success;
  bool get isFailure => this == SearchStatus.failure;
  bool get isEmpty => this == SearchStatus.empty;
}

class SearchNotesState extends Equatable {
  const SearchNotesState({
    this.status = SearchStatus.initial,
    this.notes = const [],
  });

  final SearchStatus status;

  final List<Note> notes;

  SearchNotesState copyWith({
    SearchStatus? status,
    List<Note>? notes,
  }) {
    return SearchNotesState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        status,
        notes,
      ];
}
