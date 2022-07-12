// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/models/product_model.dart';
import 'package:shamo_flutter/theme/theme.dart';

import '../pages/page_detail_product.dart';

class PopularCard extends StatelessWidget {
  final ProductModel product;

  const PopularCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailProduct(product)));
      },
      child: Container(
        width: 215,
        height: 320,
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
                    image: NetworkImage(
                      product.gallery[0].url,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                product.categories.name,
                style: kRegular.copyWith(
                  fontSize: 12,
                  color: kGreyColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                product.name,
                style: kSemiBold.copyWith(
                  fontSize: 18,
                  color: kBlackColor,
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
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
