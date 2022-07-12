import 'package:flutter/material.dart';
import 'package:shamo_flutter/models/product_model.dart';

class FamiliarShoe extends StatelessWidget {
  final ProductModel product;
  const FamiliarShoe({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          image: NetworkImage(product.gallery[0].url),
        ),
      ),
    );
  }
}
