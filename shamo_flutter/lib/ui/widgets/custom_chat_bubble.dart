// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;
  const ChatBubble({
    Key? key,
    this.text = '',
    this.isSender = true,
    this.hasProduct = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.only(bottom: 12),
        width: MediaQuery.of(context).size.width * 0.60,
        decoration: BoxDecoration(
          color: isSender ? kBackgroundColor4 : kBackgorundColor2,
          borderRadius: BorderRadius.only(
            topLeft: isSender ? Radius.circular(12) : Radius.circular(0),
            topRight: isSender ? Radius.circular(0) : Radius.circular(12),
            bottomLeft: isSender ? Radius.circular(12) : Radius.circular(0),
            bottomRight: isSender ? Radius.circular(12) : Radius.circular(0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/image_newarrival1.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: kRegular.copyWith(
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$57,15',
                        style: kRegular.copyWith(
                          color: kBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: kRegular.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: kMedium.copyWith(
                        color: Color(0xFF2B2844),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        hasProduct ? productPreview() : SizedBox(),
        Container(
          width: MediaQuery.of(context).size.width * 0.60,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: EdgeInsets.only(bottom: isSender ? 12 : 30),
          decoration: BoxDecoration(
            color: isSender ? kBackgroundColor4 : kBackgorundColor2,
            borderRadius: BorderRadius.only(
              topLeft: isSender ? Radius.circular(12) : Radius.circular(0),
              topRight: isSender ? Radius.circular(0) : Radius.circular(12),
              bottomLeft: isSender ? Radius.circular(12) : Radius.circular(0),
              bottomRight: isSender ? Radius.circular(12) : Radius.circular(0),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: kRegular.copyWith(
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
