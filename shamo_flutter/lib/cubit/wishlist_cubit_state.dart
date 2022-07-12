part of 'wishlist_cubit_cubit.dart';

@immutable
abstract class WishlistCubitState extends Equatable {
  const WishlistCubitState();

  @override
  List<Object> get props => [];
}

class WishlistCubitInitial extends WishlistCubitState {}

class WishlistLoading extends WishlistCubitState {}

class WishlistSuccess extends WishlistCubitState {
  final List<ProductModel> wishlist;

  const WishlistSuccess(this.wishlist);

  @override
  // TODO: implement props
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistCubitState {
  final String error;

  const WishlistError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
