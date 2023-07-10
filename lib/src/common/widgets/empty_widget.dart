import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    required this.imagePath,
    required this.errorMessage,
    super.key,
  });

  final String imagePath;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AssetConsts.fileNotFound,
        ),
        Text(
          errorMessage,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
