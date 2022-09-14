// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/auth_cubit_cubit.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_text_input.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController userName = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
              'Full Name',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextInput(
              hintText: 'Your Full Name',
              imgUrl: 'assets/icons/icon_fullName.png',
              textEditingController: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Username',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextInput(
              hintText: 'Your Username',
              imgUrl: 'assets/icons/icon_username.png',
              textEditingController: userName,
            ),
            SizedBox(
              height: 20,
            ),
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
              hintText: 'Your Email Address ',
              imgUrl: 'assets/icons/icon_email.png',
              textEditingController: emailController,
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
              textEditingController: passwordController,
              obsecureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<AuthCubit, AuthCubitState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  title: 'Sign Up',
                  onPressed: () {
                    context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        username: userName.text);
                  },
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    }

    Widget tacSection() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: kRegular.copyWith(
                    fontSize: 12,
                    color: kGreyColor,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Sign in',
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

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              header(),
              inputSection(),
            ],
          ),
          tacSection(),
        ],
      ),
    );
  }
}
