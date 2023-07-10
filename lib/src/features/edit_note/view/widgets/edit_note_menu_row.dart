import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';

class EditNoteMenuRow extends StatefulWidget {
  const EditNoteMenuRow({
    this.note,
    super.key,
  });

  final Note? note;

  @override
  State<EditNoteMenuRow> createState() => _EditNoteMenuRowState();
}

class _EditNoteMenuRowState extends State<EditNoteMenuRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocListener<EditNoteCubit, EditNoteState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {},
          child: BlocBuilder<EditNoteCubit, EditNoteState>(
            builder: (context, state) {
              final isEdited = state.status.isEdited;
              return Theme(
                data: ThemeData(dialogBackgroundColor: AppTheme.nero),
                child: Builder(
                  builder: (context) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        if (!isEdited) {
                          context.go(RouteConsts.homeRoute);
                        } else {
                          showDialog<void>(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                title: Image.asset(
                                  AssetConsts.info,
                                  color: Colors.white,
                                ),
                                message: 'Are you sure you want discard your '
                                    'changes ?',
                                actions: [
                                  Container(
                                    width: 112,
                                    height: 39,
                                    decoration: const BoxDecoration(),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppTheme.red,
                                      ),
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: const Text(
                                        'Discard',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    width: 112,
                                    height: 39,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppTheme.green,
                                      ),
                                      onPressed: () {
                                        context
                                            .read<EditNoteCubit>()
                                            .onSaveNoteButtonPressed(
                                              widget.note,
                                            );

                                        context.go(
                                          RouteConsts.homeRoute,
                                        );
                                      },
                                      child: const Text(
                                        'Save',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
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
              );
            },
          ),
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.darkGrey,
            ),
            child: Center(
              child: Image.asset(
                AssetConsts.visibility,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 21,
        ),
        BlocBuilder<EditNoteCubit, EditNoteState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            final isEdited = state.status.isEdited;
            return Theme(
              data: ThemeData(dialogBackgroundColor: AppTheme.nero),
              child: Builder(
                builder: (context) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: !isEdited
                        ? null
                        : () {
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return CustomAlertDialog(
                                  title: Image.asset(
                                    AssetConsts.info,
                                    color: Colors.white,
                                  ),
                                  message: 'Save changes?',
                                  actions: [
                                    Container(
                                      width: 112,
                                      height: 39,
                                      decoration: const BoxDecoration(),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppTheme.red,
                                        ),
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text(
                                          'Discard',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(),
                                      width: 112,
                                      height: 39,
                                      child: ElevatedButton(
                                        key: const Key('save_note'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppTheme.green,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<EditNoteCubit>()
                                              .onSaveNoteButtonPressed(
                                                widget.note,
                                              );

                                          context.go(
                                            RouteConsts.homeRoute,
                                          );
                                        },
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppTheme.darkGrey,
                      ),
                      child: Image.asset(
                        AssetConsts.save,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
