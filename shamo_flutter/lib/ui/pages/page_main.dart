// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/pages/homePage/page_chat.dart';
import 'package:shamo_flutter/ui/pages/homePage/page_home.dart';
import 'package:shamo_flutter/ui/pages/homePage/page_profile.dart';
import 'package:shamo_flutter/ui/pages/homePage/page_wishlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Widget floatButton() {
      return FloatingActionButton(
        child: Image.asset(
          'assets/icons/icon_cart.png',
          width: 20,
          height: 20,
        ),
        backgroundColor: kGreenColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      );
    }

    Widget customBottomNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            onTap: (value) {
              print(value);
              setState(() {
                index = value;
              });
            },
            currentIndex: index,
            backgroundColor: Color(0xFF252836),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_home.png',
                  width: 21,
                  color: index == 0 ? kPrimaryColor : kGreyColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_chat.png',
                  color: index == 1 ? kPrimaryColor : kGreyColor,
                  width: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_wishlist.png',
                  color: index == 2 ? kPrimaryColor : kGreyColor,
                  width: 21,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/icon_profile.png',
                  color: index == 3 ? kPrimaryColor : kGreyColor,
                  width: 21,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget buildContent() {
      switch (index) {
        case 0:
          return HomePage();
        case 1:
          return ChatPage();
        case 2:
          return WishListPage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      floatingActionButton: floatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNavbar(),
      backgroundColor: kBackgroundColor,
      body: buildContent(),
    );
  }
}
