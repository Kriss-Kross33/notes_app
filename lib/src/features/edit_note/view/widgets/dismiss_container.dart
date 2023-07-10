import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class DismissContainer extends StatelessWidget {
  const DismissContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: AppTheme.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(AssetConsts.delete),
      ),
    );
  }
}
