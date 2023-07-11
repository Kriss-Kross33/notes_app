import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';
import 'package:notes_app/src/features/home/blocs/blocs.dart';
import 'package:notes_app/src/features/home/view/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(FetchNotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('home'),
      floatingActionButton: const AddNoteButton(),
      body: SafeArea(
        child: BlocListener<EditNoteCubit, EditNoteState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              Fluttertoast.showToast(
                msg: 'Note added succesfully',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: AppTheme.darkGrey,
                textColor: Colors.white,
                fontSize: 16,
              );
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                  ),
                  const Positioned(
                    top: 0,
                    left: 24,
                    right: 24,
                    child: HomeMenuRow(),
                  ),
                  BlocBuilder<NoteBloc, NoteState>(
                    builder: (context, state) {
                      return switch (state.status) {
                        NotesStatus.initial => const SizedBox.shrink(),
                        NotesStatus.empty => const EmptyWidget(
                            key: Key('empty_widget'),
                            imagePath: AssetConsts.empty,
                            errorMessage: 'Create your first note !',
                          ),
                        NotesStatus.success => NoteListWidget(
                            notes: state.notes,
                          ),
                        NotesStatus.failure => const SizedBox.shrink(),
                        NotesStatus.loading => const SizedBox.shrink(),
                      };
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
