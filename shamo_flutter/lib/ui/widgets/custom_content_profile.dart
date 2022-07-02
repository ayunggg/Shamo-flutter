// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class ContentProfile extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ContentProfile({Key? key, this.title = '', required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                title,
                style: kRegular.copyWith(
                  fontSize: 13,
                  color: kGreyColor,
                ),
              ),
            ),
            Container(
                child: Image.asset(
              'assets/icons/icon_next_arrow.png',
              width: 12,
              height: 12,
            )),
          ],
        ),
      ),
    );
  }
}
