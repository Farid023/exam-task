import 'package:e_commerce_task/cubits/trash/trash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/fake_store_service.dart';

class TrashCubit extends Cubit<TrashState> {
  TrashCubit() : super(TrashInitial());



  void getDeletedProducts() async {
    try {
      emit(TrashLoading());
      final result = await FakeStoreService.getProducts();
      emit(TrashSuccess(data: result));
    } catch (e) {
      emit(TrashFailure(
          errorMessage: "Error occurred. Please try again later."));
    }
  }




}
