// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_content_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/image_profile.png',
                  width: 64,
                  height: 64,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Alex',
                        style: kSemiBold.copyWith(
                          fontSize: 24,
                          color: kWhiteColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '@alexkeinn',
                        style: kRegular.copyWith(
                          fontSize: 16,
                          color: kGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset(
                    'assets/icons/icon_exit.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
      );
    }

    Widget buildContent() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ContentProfile(
              title: 'Edit Profile',
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
            ),
            ContentProfile(
              title: 'Your Orders',
              onTap: () {},
            ),
            ContentProfile(
              title: 'Help',
              onTap: () {},
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'General',
              style: kSemiBold.copyWith(
                fontSize: 16,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ContentProfile(
              title: 'Privacy & Policy',
              onTap: () {},
            ),
            ContentProfile(
              title: 'Term of Service',
              onTap: () {},
            ),
            ContentProfile(
              title: 'Rate App',
              onTap: () {},
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            buildContent(),
          ],
        ));
  }
}
