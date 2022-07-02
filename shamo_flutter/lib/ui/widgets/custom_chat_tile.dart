// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chat');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo/logo_shamo_bg.png',
                  width: 54,
                  height: 54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: kRegular.copyWith(
                          fontSize: 15,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Good night, This item is on...',
                        style: kLight.copyWith(
                          color: kGreyColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: kRegular.copyWith(
                    fontSize: 10,
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Color(0xFF2B2939),
            )
          ],
        ),
      ),
    );
  }
}
