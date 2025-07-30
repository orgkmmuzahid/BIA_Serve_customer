import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/return_product/repository/return_product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'return_product_list_state.dart';

class ReturnProductListCubit extends Cubit<ReturnProductListState> {
  ReturnProductListCubit() : super(const ReturnProductListState(isLoading: false, returnProducts: []));

  final ReturnProductRepository _repository = getIt();

  Future<void> fetch() async {
    emit(const ReturnProductListState(isLoading: true, returnProducts: []));
    final response = await _repository.fetchReturnProduct();

    emit(ReturnProductListState(returnProducts: response, isLoading: false));
  }

  Future<void> loadMore() async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.fetchReturnProduct();
    emit(ReturnProductListState(isLoading: false, returnProducts: [...state.returnProducts, ...response]));
  }
}
