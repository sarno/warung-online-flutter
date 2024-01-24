part of 'makanan_bloc.dart';

@freezed
class MakananState with _$MakananState {
  const factory MakananState.initial() = _Initial;
  const factory MakananState.loading() = _Loading;
  const factory MakananState.loaded(List<Product> products) = _Loaded;
  const factory MakananState.error(String message) = _Error;
}
