// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        child: AppBar(
          backgroundColor: kBackgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              Image.asset(
                'assets/logo/logo_shamo_online.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: kMedium.copyWith(
                      color: kWhiteColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Online',
                    style: kLight.copyWith(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(70),
      );
    }

    Widget productPreview() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(12),
        width: 225,
        height: 75,
        decoration: BoxDecoration(
          color: kBackgorundColor3,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/image_newarrival1.png',
                width: 54,
                height: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'COURT VISIO...',
                    style: kRegular.copyWith(
                      fontSize: 14,
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: kMedium.copyWith(
                      fontSize: 14,
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/icons/icon_cancel.png',
              width: 22,
              height: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        color: kBackgorundColor2,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Type Message',
                        hintStyle: kRegular.copyWith(
                          fontSize: 14,
                          color: kGreyColor,
                        ),
                      ),
                      style: kRegular.copyWith(
                        fontSize: 16,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/icons/icon_send.png',
                  width: 45,
                  height: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            ChatBubble(
              text: 'Hi, This item is still available?',
              isSender: true,
              hasProduct: true,
            ),
            ChatBubble(
              text: 'Good night, This item is only available in size 42 and 43',
              isSender: false,
            ),
            ChatBubble(
              text: 'Owww, it suits me very well',
              isSender: true,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: buildContent(),
    );
  }
}
