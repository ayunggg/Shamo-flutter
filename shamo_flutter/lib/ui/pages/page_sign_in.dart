// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_text_input.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tacSection() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: kRegular.copyWith(
                    fontSize: 12,
                    color: kGreyColor,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Sign up',
                  style: kMedium.copyWith(
                    fontSize: 12,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: kSemiBold.copyWith(
                fontSize: 24,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign In Countinue',
              style: kRegular.copyWith(
                fontSize: 14,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: EdgeInsets.only(
          top: 160,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextInput(
              hintText: 'Your email address',
              imgUrl: 'assets/icons/icon_email.png',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextInput(
              hintText: 'Your Password',
              imgUrl: 'assets/icons/icon_password.png',
              obsecureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            header(),
            inputSection(),
            tacSection(),
          ],
        ),
      ),
    );
  }
}
