import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDatasource _productRemoteDataSource;

  AllProductBloc(
    this._productRemoteDataSource,
  ) : super(const _Initial()) {
    on<_GetAllProduct>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDataSource.getAllProducts();
      response.fold(
        (l) => emit(const AllProductState.error('Internal server error')),
        (r) => emit(AllProductState.loaded(r.data!.data!)),
      );
    });
  }
}
