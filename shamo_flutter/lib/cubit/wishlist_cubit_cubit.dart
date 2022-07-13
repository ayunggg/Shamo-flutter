import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shamo_flutter/models/product_model.dart';

part 'wishlist_cubit_state.dart';

class WishlistCubitCubit extends Cubit<bool> {
  WishlistCubitCubit() : super(false);

  List<ProductModel> _wishList = [];

  List<ProductModel> get wishlist => _wishList;

  set wishList(List<ProductModel> wishList) {
    _wishList = wishList;
  }

  bool isWishlist(ProductModel productModel) {
    if (_wishList.indexWhere((element) => element.id == productModel.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  setProduct(ProductModel productModel) {
    if (!isWishlist(productModel)) {
      _wishList.add(productModel);
    } else {
      _wishList.removeWhere((element) => element.id == productModel.id);
    }
  }
}
