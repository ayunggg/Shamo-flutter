// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/auth_cubit_cubit.dart';
import 'package:shamo_flutter/cubit/product_cubit.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/widgets/custom_categories_item.dart';
import 'package:shamo_flutter/ui/widgets/custom_populard_card.dart';
import 'package:shamo_flutter/ui/widgets/custom_small_card_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProductCubit>().fetchProduct();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthCubitState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hallo, ${state.user.name}',
                          style: kSemiBold.copyWith(
                            fontSize: 24,
                            color: kWhiteColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '@${state.user.username}',
                          style: kRegular.copyWith(
                            fontSize: 16,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 30,
                    top: 35,
                  ),
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/image_profile.png',
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    }

    Widget categoriesBar() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
              CategoriesItem(
                title: 'All Shoes',
                currenIndex: 0,
                isSelected: false,
                onTap: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Products',
              style: kSemiBold.copyWith(
                fontSize: 22,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopularCard(
                      imgUrl: 'assets/images/image_popular_card1.png',
                      categories: 'Hikinh',
                      name: 'COURT VISION 2.0',
                      price: '\$58,67',
                    ),
                    PopularCard(
                      imgUrl: 'assets/images/image_popular_card1.png',
                      categories: 'Hikinh',
                      name: 'COURT VISION 2.0',
                      price: '\$58,67',
                    ),
                    PopularCard(
                      imgUrl: 'assets/images/image_popular_card1.png',
                      categories: 'Hikinh',
                      name: 'COURT VISION 2.0',
                      price: '\$58,67',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: kSemiBold.copyWith(
                fontSize: 22,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            SmallCardProduct(
              imgUrl: 'assets/images/image_newarrival1.png',
              categories: 'football',
              name: 'Predator 20.3 FirmGround',
              price: '\$68,47',
            ),
            Column(
              children: [
                SmallCardProduct(
                  imgUrl: 'assets/images/image_newarrival2.png',
                  categories: 'Running',
                  name: 'Ultra 4D 5 Shoes',
                  price: '\$285,73',
                ),
                SmallCardProduct(
                  imgUrl: 'assets/images/image_newarrival3.png',
                  categories: 'Basketball',
                  name: 'Court Vision 2.0 Shoes',
                  price: '\$57,15',
                ),
                SmallCardProduct(
                  imgUrl: 'assets/images/image_newarrival4.png',
                  categories: 'Training',
                  name: 'LEGO® SPORT SHOES',
                  price: '\$92,72',
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            header(),
            categoriesBar(),
            popularProducts(),
            newArrivals(),
          ],
        ));
  }
}
