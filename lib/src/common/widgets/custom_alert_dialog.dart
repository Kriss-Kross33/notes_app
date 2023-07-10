import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.message,
    this.title,
    this.height,
    this.width,
    super.key,
    this.actions,
  });

  final Widget? title;
  final String message;
  final List<Widget>? actions;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.nero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: width ?? 330,
            height: height ?? 236,
            padding: const EdgeInsets.only(
              top: 38,
            ),
            child: Column(
              children: [
                title ?? const SizedBox.shrink(),
                SizedBox(
                  height: title != null ? 25 : 0,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: actions ?? const [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
