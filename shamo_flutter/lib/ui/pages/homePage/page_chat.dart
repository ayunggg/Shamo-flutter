// ignore_for_file: prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF1F1D2B),
        elevation: 0,
        title: Text(
          'Message Support',
          style: kMedium.copyWith(
            color: kWhiteColor,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget emptyChat() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon_headphone.png',
            width: 80,
            height: 80,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Opss no message yet?',
            style: kMedium.copyWith(
              fontSize: 16,
              color: kWhiteColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'You have never done a transaction',
            style: kRegular.copyWith(
              color: kGreyColor,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            title: 'Explore Store',
            onPressed: () {},
            width: 152,
          )
        ],
      );
    }

    Widget buildContent() {
      return Expanded(
        child: ListView(
          children: [
            ChatTile(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: Column(
        children: [
          header(),
          buildContent(),
        ],
      ),
    );
  }
}
