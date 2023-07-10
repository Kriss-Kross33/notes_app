import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/search_note/blocs/blocs.dart';

class SearchNoteScreen extends StatelessWidget {
  const SearchNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            Positioned(
              top: 0,
              left: 24,
              right: 24,
              child: TextField(
                style: Theme.of(context).textTheme.titleLarge,
                onChanged: (String? keyword) {
                  if (keyword != null) {
                    context.read<SearchNotesCubit>().onSearchNote(keyword);
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: 'Search by the keyword...',
                  hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                  suffixIcon: GestureDetector(
                    onTap: () => context.pop(),
                    child: Image.asset(AssetConsts.close),
                  ),
                  // suffixIconConstraints: suffixIconConstraints,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  fillColor: AppTheme.darkGrey,
                  focusColor: AppTheme.darkGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<SearchNotesCubit, SearchNotesState>(
              builder: (context, state) {
                return switch (state.status) {
                  SearchStatus.success => NoteListWidget(
                      notes: state.notes,
                    ),
                  SearchStatus.empty => const EmptyWidget(
                      imagePath: AssetConsts.fileNotFound,
                      errorMessage: 'File not found. Try searching again.',
                    ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
