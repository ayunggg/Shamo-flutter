// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shamo_flutter/models/cart_model.dart';
import 'package:shamo_flutter/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cart = [];

  List<CartModel> get carts => cart;

  set carts(List<CartModel> cart) {
    cart = carts;
  }

  GetTotalPrice(ProductModel productModel) {
    return productModel.price * cart[0].quantity;
  }

  fetchCart(ProductModel productModel) async {
    try {
      emit(CartLoading());

      if (productExist(productModel)) {
        int index = cart.indexWhere(
            (element) => element.productModel.id == productModel.id);
        cart[index].quantity++;

        emit(CartSuccess(cart));
        print('ini jalan 1 $cart');
      } else {
        cart.add(
          CartModel(
            id: cart.length,
            productModel: productModel,
            quantity: 1,
          ),
        );
        emit(CartSuccess(cart));
        print('ini jalan 2 $cart');
      }
    } catch (e) {
      emit(CartFailed(e.toString()));
    }
  }

  void remove_cart(int id) {
    try {
      emit(CartLoading());
      var idn = cart.removeAt(id);
      emit(CartRemove(idn.id));
    } catch (e) {
      emit(CartFailed(e.toString()));
    }
  }

  removeCart(int id) {}

  addQuantity(int id) {
    emit(CartAddQty(cart[id].quantity++));
  }

  reduceQuantity(int id) {
    if (cart[id].quantity > 1) {
      emit(CartReduceQty(cart[id].quantity--));
    }
  }

  totalItems() {
    int total = 0;
    for (var item in cart) {
      total += (item.quantity);
    }
  }

  totalPrice() {
    double totalPrice = 0;
    for (var item in cart) {
      totalPrice += (item.quantity * item.productModel.price);
      return totalPrice;
    }

    print('ini Total Price $totalPrice');
    emit(CartTotalPrice(totalPrice));
  }

  bool productExist(ProductModel productModel) {
    if (cart.indexWhere(
            (element) => element.productModel.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
