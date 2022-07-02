import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: kMedium.copyWith(
            fontSize: 18,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
