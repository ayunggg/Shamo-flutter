import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class PaymentSummaryItems extends StatelessWidget {
  final String title;
  final String description;
  const PaymentSummaryItems({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kRegular.copyWith(
              fontSize: 12,
              color: kGreyColor,
            ),
          ),
          Text(
            description,
            style: kMedium.copyWith(
              color: kWhiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
