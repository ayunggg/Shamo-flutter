// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/product_cubit.dart';
import 'package:shamo_flutter/cubit/wishlist_cubit_cubit.dart';
import 'package:shamo_flutter/models/product_model.dart';
import 'package:shamo_flutter/theme/theme.dart';
import 'package:shamo_flutter/ui/pages/page_cart.dart';
import 'package:shamo_flutter/ui/widgets/custom_button.dart';
import 'package:shamo_flutter/ui/widgets/custom_familiar_shoes.dart';

import '../../cubit/cart_cubit.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel product;
  DetailProduct(this.product);
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  void initState() {
    super.initState();
  }

  final List images = [
    'assets/images/image_newarrival1.png',
    'assets/images/image_newarrival1.png',
    'assets/images/image_newarrival1.png',
  ];

  final List familiarShoesList = [
    'assets/images/image_running1.png',
    'assets/images/image_running2.png',
    'assets/images/image_running3.png',
    'assets/images/image_running4.png',
    'assets/images/image_traning1.png',
    'assets/images/image_training2.png',
    'assets/images/image_training3.png',
    'assets/images/image_training4.png',
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.15,
          left: 2,
        ),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductSuccess) {
            return Stack(
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      items: widget.product.gallery
                          .map((e) => Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(e.url),
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.product.gallery.map((e) {
                    index++;
                    return indicator(index);
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.chevron_left,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag,
                        color: kBackgroundColor1,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width * 60,
          child: AlertDialog(
            backgroundColor: kBackgroundColor1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/icon_checklist.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: kSemiBold.copyWith(
                      fontSize: 18,
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: kRegular.copyWith(
                      color: kGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'View My Cart',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                          (route) => false);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget buildContent(List<ProductModel> productModel) {
      return Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            //NOTE : Header
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: kSemiBold.copyWith(
                          fontSize: 18,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.product.categories.name,
                        style: kRegular.copyWith(
                          fontSize: 12,
                          color: kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                            .read<WishlistCubitCubit>()
                            .setProduct(widget.product);
                        if (context
                            .read<WishlistCubitCubit>()
                            .isWishlist(widget.product)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: kGreenColor,
                              duration: Duration(seconds: 1),
                              content: Text(
                                'Has been added to the Wishlist',
                                style: kRegular.copyWith(
                                  fontSize: 12,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Color(0xFFED6363),
                              content: Text(
                                'Has been removed from the Wishlist',
                                style: kRegular.copyWith(
                                  fontSize: 12,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      });
                    },
                    child: BlocBuilder<WishlistCubitCubit, bool>(
                      builder: (context, _) {
                        return Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: context
                                    .watch<WishlistCubitCubit>()
                                    .isWishlist(widget.product)
                                ? kGreenColor
                                : kGreyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/icon_wishlist.png',
                              width: 20,
                              height: 18,
                              color: context
                                      .watch<WishlistCubitCubit>()
                                      .isWishlist(widget.product)
                                  ? kWhiteColor
                                  : Color(0xFF1F1D2B),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            //Note : PRICE
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kBackgroundColor5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: kRegular.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: kSemiBold.copyWith(
                      fontSize: 16,
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            //NOTE : DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: kMedium.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: kLight.copyWith(
                      color: kGreyColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            //NOTE : FAMILIAR SHOES
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Familiar Shoes',
                    style: kMedium.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: productModel.map((ProductModel productModel) {
                        return FamiliarShoe(
                          product: productModel,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            //NOTE : Chat Order & Add to Cart
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: Image.asset(
                      'assets/icons/icon_chat_order.png',
                      width: 54,
                      height: 54,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomButton(
                      title: 'Add to Cart',
                      onPressed: () {
                        setState(() {
                          context.read<CartCubit>().fetchCart(widget.product);
                        });

                        showSuccessDialog();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductSuccess) {
          return Scaffold(
            body: ListView(
              children: [
                header(),
                buildContent(state.product),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
