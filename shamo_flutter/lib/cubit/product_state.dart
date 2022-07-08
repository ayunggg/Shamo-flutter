part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> product;

  const ProductSuccess(this.product);

  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class ProductFailed extends ProductState {
  final String error;

  const ProductFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
