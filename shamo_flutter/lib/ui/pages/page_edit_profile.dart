// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: kBackgroundColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
            ),
          ),
          title: Text(
            'Edit Profile',
            style: kMedium.copyWith(
              fontSize: 18,
              color: kWhiteColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              color: kPrimaryColor,
              icon: Icon(
                Icons.check,
              ),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget nameInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: kRegular.copyWith(
                fontSize: 13,
                color: kGreyColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              style: kRegular.copyWith(fontSize: 16, color: kWhiteColor),
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF504F5E),
                  ),
                ),
                hintText: 'Your name',
                hintStyle: kRegular.copyWith(
                  fontSize: 16,
                  color: kWhiteColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: kRegular.copyWith(
                fontSize: 13,
                color: kGreyColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              style: kRegular.copyWith(fontSize: 16, color: kWhiteColor),
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF504F5E),
                  ),
                ),
                hintText: 'Your Username',
                hintStyle: kRegular.copyWith(
                  fontSize: 16,
                  color: kWhiteColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailaddressInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: kRegular.copyWith(
                fontSize: 13,
                color: kGreyColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            TextFormField(
              style: kRegular.copyWith(fontSize: 16, color: kWhiteColor),
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF504F5E),
                  ),
                ),
                hintText: 'Your Email Address',
                hintStyle: kRegular.copyWith(
                  fontSize: 16,
                  color: kWhiteColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buildContent() {
      return Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image_profile.png'),
                ),
              ),
            ),
            nameInput(),
            usernameInput(),
            emailaddressInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      body: ListView(
        children: [
          buildContent(),
        ],
      ),
    );
  }
}
