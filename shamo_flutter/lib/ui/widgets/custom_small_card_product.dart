// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class SmallCardProduct extends StatelessWidget {
  final String imgUrl;
  final String categories;
  final String name;
  final String price;
  const SmallCardProduct({
    Key? key,
    required this.imgUrl,
    required this.categories,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-prodcut');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFECEDEF),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    imgUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories,
                      style: kRegular.copyWith(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      name,
                      style: kSemiBold.copyWith(
                        fontSize: 18,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      price,
                      style: kMedium.copyWith(
                        fontSize: 14,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
