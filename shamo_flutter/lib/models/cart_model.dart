import 'package:equatable/equatable.dart';
import 'package:shamo_flutter/models/product_model.dart';

class CartModel extends Equatable {
  int id;
  ProductModel productModel;
  int quantity;

  CartModel({
    required this.id,
    required this.productModel,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        productModel: ProductModel.fromJson(json['product']),
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() {
    return ({
      'id': id,
      'product': productModel,
      'quantity': quantity,
    });
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        productModel,
        quantity,
      ];
}
