import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final int currenIndex;
  final bool isSelected;
  final Function() onTap;
  const CategoriesItem({
    Key? key,
    required this.title,
    required this.currenIndex,
    this.isSelected = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85,
        height: 40,
        margin: EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Color(
                    0xFF504F5E,
                  ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: kMedium.copyWith(
              fontSize: 13,
              color: kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
