// ignore_for_file: unused_element, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/wishlist_cubit_cubit.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_wishlist_card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        child: AppBar(
          centerTitle: true,
          backgroundColor: kBackgroundColor,
          elevation: 0,
          title: Text(
            'Favorite Shoes',
            style: kMedium.copyWith(
              fontSize: 18,
              color: kWhiteColor,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget emptyWishlist() {
      return Column(
        children: [
          Expanded(
            child: Container(
              color: kBackgorundColor2,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/icon_wishlist.png',
                    width: 74,
                    height: 62,
                    color: kGreenColor,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Text(
                    ' You don\'t have dream shoes?',
                    style: kMedium.copyWith(
                      fontSize: 16,
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Let\'s find your favorite shoes',
                    style: kRegular.copyWith(
                      color: kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'Explore Store',
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    width: 200,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget buildContent() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  children:
                      context.read<WishlistCubitCubit>().wishlist.map((e) {
                    return WishlistCard(productModel: e);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      body: context.read<WishlistCubitCubit>().wishlist.isEmpty
          ? emptyWishlist()
          : buildContent(),
    );
  }
}
