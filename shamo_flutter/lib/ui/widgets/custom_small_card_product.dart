// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/models/product_model.dart';
import 'package:shamo_flutter/theme/theme.dart';

class SmallCardProduct extends StatelessWidget {
  final ProductModel product;
  const SmallCardProduct({Key? key, required this.product}) : super(key: key);

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
                  image: NetworkImage(
                    product.gallery[0].url,
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
                      product.categories.name,
                      style: kRegular.copyWith(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      product.name,
                      style: kSemiBold.copyWith(
                        fontSize: 18,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '\$${product.price}',
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
