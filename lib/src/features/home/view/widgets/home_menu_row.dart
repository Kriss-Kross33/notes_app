import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/src/common/widgets/info_dialog.dart';
import 'package:notes_app/src/core/core.dart';

class HomeMenuRow extends StatefulWidget {
  const HomeMenuRow({
    super.key,
  });

  @override
  State<HomeMenuRow> createState() => _HomeMenuRowState();
}

class _HomeMenuRowState extends State<HomeMenuRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Notes',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const Spacer(),
        // AnimSearchBar(
        //     width: 400,
        //     textController: _controller,
        //     onSuffixTap: () {},
        //     onSubmitted: (String query) {}),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            context.pushNamed(RouteConsts.searchNoteRoute);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.darkGrey,
            ),
            child: Center(
              child: Image.asset(
                AssetConsts.search,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Theme(
          data: ThemeData(dialogBackgroundColor: AppTheme.nero),
          child: Builder(
            builder: (context) {
              return InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return const InfoDialog();
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
                    AssetConsts.infoOutline,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            context.pushNamed(RouteConsts.settingsRoute);
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.darkGrey,
            ),
            child: const Center(
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
