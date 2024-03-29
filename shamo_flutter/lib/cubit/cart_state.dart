// ignore_for_file: prefer_const_constructors_in_immutables

part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartProduct extends CartState {
  final List<ProductModel> product;

  CartProduct(this.product);

  @override
  // TODO: implement props
  List<Object> get props => product;
}

//NOTE : If Success Add Product To Cart
class CartSuccess extends CartState {
  final List<CartModel> product;

  CartSuccess(this.product);
  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class CartAddNew extends CartState {
  final CartModel product;

  CartAddNew(this.product);
  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class CartAddQty extends CartState {
  final int cart;

  CartAddQty(this.cart);
  @override
  // TODO: implement props
  List<Object> get props => [cart];
}

class CartReduceQty extends CartState {
  final int cart;

  CartReduceQty(this.cart);
  @override
  // TODO: implement props
  List<Object> get props => [cart];
}

class CartRemove extends CartState {
  final int id;

  CartRemove(this.id);

  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class CartTotalPrice extends CartState {
  final double price;

  CartTotalPrice(this.price);

  @override
  // TODO: implement props
  List<Object> get props => [price];
}

class CartFailed extends CartState {
  final String error;

  const CartFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [
        error,
      ];
}
