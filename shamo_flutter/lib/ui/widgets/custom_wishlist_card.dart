// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_flutter/cubit/wishlist_cubit_cubit.dart';
import 'package:shamo_flutter/models/product_model.dart';
import 'package:shamo_flutter/theme/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel productModel;
  const WishlistCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

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
            child: Image.network(
              productModel.gallery[0].url,
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
                  productModel.name,
                  style: kSemiBold.copyWith(
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${productModel.price}',
                  style: kRegular.copyWith(
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<WishlistCubitCubit>().setProduct(productModel);
            },
            child: Image.asset(
              'assets/icons/icon_love.png',
              width: 34,
              height: 34,
            ),
          ),
        ],
      ),
    );
  }
}
