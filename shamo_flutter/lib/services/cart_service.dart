import 'package:shamo_flutter/models/cart_model.dart';
import 'package:shamo_flutter/models/product_model.dart';

class CartService {
  
  List<CartModel> cart = [];

  List<CartModel> get carts => cart;

  set carts(List<CartModel> cart) {
    cart = carts;
  }

  GetTotalPrice(ProductModel productModel) {
    return productModel.price * cart[0].quantity;
  }
 

  fetchCart(ProductModel productModel) {
    try {
      if (productExist(productModel)) {
        int index = cart.indexWhere(
            (element) => element.productModel.id == productModel.id);
        cart[index].quantity++;
      } else {
        cart.add(
          CartModel(
            id: cart.length,
            productModel: productModel,
            quantity: 1,
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  removeCart(int id) {
    cart.removeAt(id);
  }

  addQuantity(int id) {
    cart[id].quantity++;
  }

  reduceQuantity(int id) {
    if (cart.length > 1) {
      cart[id].quantity--;
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
    }
  }

  productExist(ProductModel productModel) {
    if (cart.indexWhere((element) => element.id == productModel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
