import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/cubit/product_state.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';

class ProductCubit extends SafeCubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final VendorDetailsRepository _repository = getIt();
  int _getPage(List<ProductModel> response) => response.isEmpty ? state.page : state.page + 1;

  Future<void> fetch() async {
    emit(const ProductState(isLoading: true));
    final response = await _repository.products(page: state.page);
    emit(ProductState(products: [...state.products ?? [], ...response], page: _getPage(response)));
  }

  Future<void> loadMore() async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.products(page: state.page);
    emit(state.copyWith(isLoading: false, products: [...state.products ?? [], ...response], page: _getPage(response)));
  }
}
