// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_checkout_card.dart';
import 'package:shamo_flutter/ui/widgets/custom_payment_summary_items.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: Icon(Icons.chevron_left),
        title: Text(
          'Checkout Details',
          style: kMedium.copyWith(
            color: kWhiteColor,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget addressDetails() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kBackgorundColor2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Details',
              style: kMedium.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/icons/icon_start_location.png',
                      width: 40,
                      height: 40,
                    ),
                    Image.asset(
                      'assets/icons/icon_line.png',
                      width: 30,
                      height: 30,
                    ),
                    Image.asset(
                      'assets/icons/icon_end_location.png',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Store Location',
                      style: kLight.copyWith(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Adidas Core',
                      style: kMedium.copyWith(
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your Address',
                      style: kLight.copyWith(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Marsemoon',
                      style: kMedium.copyWith(
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget paymentSummary() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kBackgorundColor2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: kMedium.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            PaymentSummaryItems(
                title: 'Product Quantity', description: '2 Items'),
            PaymentSummaryItems(
                title: 'Product Price', description: '\$575.96'),
            PaymentSummaryItems(title: 'Shipping', description: 'Free'),
            SizedBox(
              height: 11,
            ),
            Divider(
              thickness: 0.5,
              color: kGreyColor,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: kSemiBold.copyWith(
                    color: kBlueColor,
                  ),
                ),
                Text(
                  '\$575.92',
                  style: kSemiBold.copyWith(
                    color: kWhiteColor,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget buildContent() {
      return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Items',
              style: kMedium.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            CheckoutCard(),
            SizedBox(
              height: 30,
            ),
            addressDetails(),
            SizedBox(
              height: 30,
            ),
            paymentSummary(),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.5,
              color: kGreyColor,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
                title: 'Checkout Now',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/success-checkout', (route) => false);
                })
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      body: ListView(
        children: [
          buildContent(),
        ],
      ),
    );
  }
}
