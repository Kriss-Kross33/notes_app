import 'package:flutter/material.dart';
import 'package:notes_app/src/core/core.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.nero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Container(
        width: 330,
        height: 236,
        padding: const EdgeInsets.only(
          top: 38,
          left: 28,
          right: 28,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Designed by - ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Redesigned by - ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Illustrations - ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Icons - ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fonts - ',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              child: Text(
                'Made by - ',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
