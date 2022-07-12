import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_flutter/cubit/auth_cubit_cubit.dart';
import 'package:shamo_flutter/services/product_service.dart';

import '../models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void fetchProduct() async {
    try {
      emit(ProductLoading());

      List<ProductModel> product = await ProductService().fetchProduct();

      emit(ProductSuccess(product));
    } catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }
}
