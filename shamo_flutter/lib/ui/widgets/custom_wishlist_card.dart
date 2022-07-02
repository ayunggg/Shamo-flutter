// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBackgorundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/image_newarrival1.png',
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: kSemiBold.copyWith(
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$143,98',
                  style: kRegular.copyWith(
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icons/icon_love.png',
            width: 34,
            height: 34,
          ),
        ],
      ),
    );
  }
}
