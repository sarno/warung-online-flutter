import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([])) {
    on<_AddItem>((event, emit) {
      final currentState = state as _Loaded;

      if (currentState.productQty
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.productQty
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.productQty[index];

        final newItem = item.copyWith(quantity: item.quantity + 1);
        final newItems = currentState.productQty
            .map((e) => e.product.id == newItem.product.id ? newItem : e)
            .toList();
        emit(_Loaded(newItems));
      } else {
        final newItem = ProductQuantity(product: event.product, quantity: 1);
        final newItems = [...currentState.productQty, newItem];
        emit(_Loaded(newItems));
      }
    });
  }
}
