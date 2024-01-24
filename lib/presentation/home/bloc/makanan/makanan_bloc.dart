import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';

part 'makanan_bloc.freezed.dart';
part 'makanan_event.dart';
part 'makanan_state.dart';

class MakananBloc extends Bloc<MakananEvent, MakananState> {
  final ProductRemoteDatasource _productRemoteDatasource;

  MakananBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<MakananEvent>((event, emit) async {
      emit(const MakananState.loading());
      final response = await _productRemoteDatasource.getProductByCategory(6);
      response.fold(
        (l) => emit(const MakananState.error('Internal server error')),
        (r) => emit(MakananState.loaded(r.data!.data!)),
      );
    });
  }
}
