import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout Success',
          style: kMedium.copyWith(
            fontSize: 18,
            color: kWhiteColor,
          ),
        ),
      );
    }

    Widget buildContent() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
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
              'You made a transaction',
              style: kMedium.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: kRegular.copyWith(
                color: kGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'Order Other Shoes',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              width: 200,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      body: buildContent(),
    );
  }
}
