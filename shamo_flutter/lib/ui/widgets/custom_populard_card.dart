// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class PopularCard extends StatelessWidget {
  final String imgUrl;
  final String categories;
  final String name;
  final String price;

  const PopularCard({
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
        Navigator.pushNamed(context, '/detail-product');
      },
      child: Container(
        width: 215,
        height: 280,
        margin: EdgeInsets.only(
          right: 30,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            bottom: 20,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 215,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFECEDEF),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      imgUrl,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
                  color: kBlackColor,
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
      ),
    );
  }
}
