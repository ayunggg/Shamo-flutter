// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_flutter/cubit/cart_cubit.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          elevation: 1,
          title: Text(
            'Your Cart',
          ),
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget emptyCart() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/icon_checkout.png',
              width: 80,
              height: 70,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
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
            CustomButton(
              title: 'Explore Store',
              width: 160,
              margin: EdgeInsets.only(top: 20),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return ListView(
          children: context.read<CartCubit>().carts.map((e) {
        return CartCard(
          cartModel: e,
        );
      }).toList());
    }

    Widget bottomNavbar() {
      return Container(
        height: 180,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: kRegular.copyWith(
                    color: kWhiteColor,
                  ),
                ),
                Text(
                  '\$287,96',
                  style: kSemiBold.copyWith(
                    fontSize: 16,
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: Color(
                0xFF2B2938,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: kSemiBold.copyWith(
                        fontSize: 16,
                        color: kWhiteColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: kWhiteColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      body: buildContent(),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
