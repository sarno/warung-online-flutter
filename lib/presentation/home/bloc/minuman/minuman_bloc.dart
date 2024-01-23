import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'minuman_bloc.freezed.dart';
part 'minuman_event.dart';
part 'minuman_state.dart';

class MinumanBloc extends Bloc<MinumanEvent, MinumanState> {
  final ProductRemoteDatasource _productRemoteDatasource;

  MinumanBloc(
    this._productRemoteDatasource,
  ) : super(_Initial()) {
    on<MinumanEvent>((event, emit) async {
      emit(const MinumanState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(5);

      response.fold(
        (l) => emit(const MinumanState.error('Internal server error')),
        (r) => emit(MinumanState.loaded(r.data!.data!)),
      );
    });
  }
}
