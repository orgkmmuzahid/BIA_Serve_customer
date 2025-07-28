import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'return_product_event.dart';
part 'return_product_state.dart';

class ReturnProductBloc extends Bloc<ReturnProductEvent, ReturnProductState> {
  ReturnProductBloc() : super(ReturnProductInitial()) {
    on<ReturnProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
