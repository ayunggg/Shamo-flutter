import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo_flutter/cubit/cart_cubit.dart';
import 'package:shamo_flutter/theme/theme.dart';

import '../../models/cart_model.dart';

class CartCard extends StatefulWidget {
  final CartModel cartModel;
  const CartCard({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: kBackgorundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.cartModel.productModel.gallery[0].url,
                  width: 60,
                  height: 60,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartModel.productModel.name,
                      style: kSemiBold.copyWith(
                        color: kWhiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$${widget.cartModel.productModel.price}',
                      style: kRegular.copyWith(
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                            .read<CartCubit>()
                            .addQuantity(widget.cartModel.id);
                      });
                    },
                    child: Image.asset(
                      'assets/icons/icon_plus.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.cartModel.quantity.toString(),
                    style: kMedium.copyWith(
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        context
                            .read<CartCubit>()
                            .reduceQuantity(widget.cartModel.id);
                      });
                    },
                    child: widget.cartModel.quantity > 1
                        ? Image.asset(
                            'assets/icons/icon_min.png',
                            width: 16,
                            height: 16,
                          )
                        : const SizedBox(
                            width: 16,
                            height: 16,
                          ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/icon_destroy.png',
                width: 16,
                height: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    context.read<CartCubit>().remove_cart(widget.cartModel.id);
                  });
                },
                child: Text(
                  'Remove',
                  style: kLight.copyWith(
                    fontSize: 12,
                    color: kRedColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
