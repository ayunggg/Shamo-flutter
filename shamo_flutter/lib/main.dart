// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shamo_flutter/ui/pages/detail_chat_page.dart';
import 'package:shamo_flutter/ui/pages/page_cart.dart';
import 'package:shamo_flutter/ui/pages/page_checkout.dart';
import 'package:shamo_flutter/ui/pages/page_detail_product.dart';
import 'package:shamo_flutter/ui/pages/page_edit_profile.dart';
import 'package:shamo_flutter/ui/pages/page_main.dart';
import 'package:shamo_flutter/ui/pages/page_sign_in.dart';
import 'package:shamo_flutter/ui/pages/page_sign_up.dart';
import 'package:shamo_flutter/ui/pages/page_splash.dart';
import 'package:shamo_flutter/ui/pages/page_success_checkout.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/main': (context) => MainPage(),
        '/chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfile(),
        '/detail-product': (context) => DetailProduct(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/success-checkout': (context) => SuccessCheckoutPage(),
      },
    );
  }
}
