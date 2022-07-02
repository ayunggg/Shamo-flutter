import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: kBackgorundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/image_newarrival1.png',
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
                      'Terrex Urban Low',
                      style: kSemiBold.copyWith(
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$143,98',
                      style: kRegular.copyWith(
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/icon_plus.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: kMedium.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/icons/icon_min.png',
                    width: 16,
                    height: 16,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/icon_destroy.png',
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: kLight.copyWith(
                  fontSize: 12,
                  color: kRedColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
