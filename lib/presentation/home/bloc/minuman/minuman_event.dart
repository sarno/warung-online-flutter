part of 'minuman_bloc.dart';

@freezed
class MinumanEvent with _$MinumanEvent {
  const factory MinumanEvent.started() = _Started;
  const factory MinumanEvent.getMinuman() = _GetMinuman;
}
