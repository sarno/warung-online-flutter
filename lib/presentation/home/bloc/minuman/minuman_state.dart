part of 'minuman_bloc.dart';

@freezed
class MinumanState with _$MinumanState {
  const factory MinumanState.initial() = _Initial;
  const factory MinumanState.loading() = _Loading;
  const factory MinumanState.loaded(List<Product> products) = _Loaded;
  const factory MinumanState.error(String message) = _Error;
}
