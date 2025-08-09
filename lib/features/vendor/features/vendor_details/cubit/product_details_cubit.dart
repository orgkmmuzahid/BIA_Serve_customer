import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/cubit/product_details_state.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';

class ProductDetailsCubit extends SafeCubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsState());
  final VendorDetailsRepository _repository = getIt();

  Future<void> fetch({required String productId}) async {
    emit(const ProductDetailsState(isLoading: true));
    final responce = await _repository.productDetails(productId: productId);
    emit(ProductDetailsState(model: responce));
  }
}
