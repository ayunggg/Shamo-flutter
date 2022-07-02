// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String imgUrl;
  final bool obsecureText;
  const CustomTextInput({
    Key? key,
    required this.hintText,
    required this.imgUrl,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xFF2B2937), borderRadius: BorderRadius.circular(18)),
      child: TextFormField(
        obscureText: obsecureText,
        style: kRegular.copyWith(
          fontSize: 16,
          color: kWhiteColor,
        ),
        cursorColor: kWhiteColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 19),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.only(top: 19, bottom: 19, left: 17, right: 16),
            child: Image.asset(
              imgUrl,
              width: 17,
              fit: BoxFit.contain,
            ),
          ),
          hintText: hintText,
          hintStyle: kRegular.copyWith(
            fontSize: 14,
            color: kGreyColor,
          ),
          hintTextDirection: TextDirection.ltr,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
