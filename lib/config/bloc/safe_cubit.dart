import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SafeCubit<State> extends Cubit<State> {
  SafeCubit(State initialState) : super(initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    } else {
      AppLogger.warning('Cubit is closed, cannot emit state.', tag: 'Safe Cubit');
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
