// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notes_app/src/common/common.dart';
// import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';
// import 'package:notes_app/src/features/note_detail/view/widgets/widgets.dart';

// class EditNoteScreen extends StatefulWidget {
//   const EditNoteScreen({required this.note, super.key});

//   final Note note;

//   @override
//   State<EditNoteScreen> createState() => _EditNoteScreenState();
// }

// class _EditNoteScreenState extends State<EditNoteScreen> {
//   late TextEditingController _titleController;
//   late TextEditingController _bodyController;

//   @override
//   void initState() {
//     super.initState();
//     _titleController = TextEditingController(
//       text: widget.note.title,
//     );
//     _bodyController = TextEditingController(text: widget.note.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(
//           top: 50,
//           left: 24,
//           right: 24,
//         ),
//         child: Column(
//           children: [
//             EditNoteMenuRow(
//               note: widget.note,
//               title: _titleController.text,
//               body: _bodyController.text,
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Expanded(
//               child: MediaQuery.removePadding(
//                 context: context,
//                 removeTop: true,
//                 child: ListView(
//                   children: [
//                     BlocBuilder<EditNoteCubit, EditNoteState>(
//                       buildWhen: (previous, current) =>
//                           previous.title != current.title,
//                       builder: (context, state) {
//                         return TextField(
//                           controller: _titleController,
//                           maxLines: null,
//                           style: Theme.of(context)
//                               .textTheme
//                               .displaySmall
//                               ?.copyWith(
//                                 fontWeight: FontWeight.w400,
//                               ),
//                           onChanged: (String titleString) {
//                             print(titleString);
//                             context
//                                 .read<EditNoteCubit>()
//                                 .onTitleInput(_titleController.text);
//                           },
//                           decoration: InputDecoration(
//                             hintStyle: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall
//                                 ?.copyWith(
//                                   color: const Color(0xFF9A9A9A),
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                             hintText: 'Title',
//                             border: InputBorder.none,
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     BlocBuilder<EditNoteCubit, EditNoteState>(
//                       buildWhen: (previous, current) =>
//                           previous.body != current.body,
//                       builder: (context, state) {
//                         return TextField(
//                           controller: _bodyController,
//                           keyboardType: TextInputType.multiline,
//                           maxLines: null,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineMedium
//                               ?.copyWith(
//                                 fontWeight: FontWeight.w400,
//                               ),
//                           onChanged: (String bodyString) {
//                             context
//                                 .read<EditNoteCubit>()
//                                 .onBodyInput(_bodyController.text);
//                           },
//                           decoration: InputDecoration(
//                             hintStyle: Theme.of(context)
//                                 .textTheme
//                                 .headlineMedium
//                                 ?.copyWith(
//                                   color: const Color(0xFF9A9A9A),
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                             hintText: 'Type something...',
//                             border: InputBorder.none,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
