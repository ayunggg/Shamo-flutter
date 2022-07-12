// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/auth_cubit_cubit.dart';
import 'package:shamo_flutter/cubit/product_cubit.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main': (context) => MainPage(),
          '/chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfile(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/success-checkout': (context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}
