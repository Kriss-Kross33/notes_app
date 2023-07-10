// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app/src/core/core.dart';
// import 'package:notes_app/src/features/home/blocs/blocs.dart';

// class CustomSearchDelegate extends SearchDelegate {
//   CustomSearchDelegate({required this.searchNotesCubit});
//   final SearchNotesCubit searchNotesCubit;

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return Theme.of(context).copyWith(
//       inputDecorationTheme: InputDecorationTheme(
//         contentPadding: EdgeInsets.symmetric(vertical: 10),
//         hintStyle: Theme.of(context).textTheme.bodyMedium,
//         isDense: true,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(
//             color: Color(0xFFACADAD),
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(
//             color: Color(0xFFACADAD),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: const BorderSide(
//             color: Color(0xFFACADAD),
//           ),
//         ),
//         fillColor: AppTheme.nero,
//         focusColor: AppTheme.nero,
//         hoverColor: AppTheme.nero,
//       ),
//     );
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: query.isEmpty ? null : () => query = '',
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return SizedBox.shrink();
//     // GestureDetector(
//     //   onTap: () => close(context, null),
//     //   child: Icon(
//     //     Icons.arrow_back_ios,
//     //     color: AppTheme.nero,
//     //     size: 20,
//     //   ),
//     // );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     searchNotesCubit.onSearchNote('');

//     return BlocBuilder<SearchNotesCubit, SearchNotesState>(
//         bloc: searchNotesCubit,
//         builder: (context, state) {
//           // if (state is SearchMovieLoadedState) {
//           //   if (state.movies!.isEmpty) {
//           //     return Center(
//           //       child: Padding(
//           //         padding: EdgeInsets.symmetric(horizontal: 70),
//           //         child: Text(
//           //           'No Notes',
//           //           textAlign: TextAlign.center,
//           //         ),
//           //       ),
//           //     );
//           //   }
//           //   return ListView.builder(
//           //     itemCount: 0,
//           //     itemBuilder: (context, index) {
//           //       return Container();
//           //     },
//           //   );
//           // }
//           // else if (state is SearchMovieErrorState) {
//           //   return AppErrorWidget(
//           //     failureType: state.failureType,
//           //     onPressed: () => searchMovieBloc
//           //         .add(MovieSearchTriggeredEvent(queryString: query)),
//           //   );
//           // }
//           return const SizedBox.shrink();
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return SizedBox.shrink();
//   }
// }
