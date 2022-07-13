part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

//NOTE : If Success Add Product To Cart
class CartSuccess extends CartState {
  final List<CartModel> product;

  const CartSuccess(this.product);
  @override
  // TODO: implement props
  List<Object> get props => [product];
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
