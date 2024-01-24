part of 'makanan_bloc.dart';

@freezed
class MakananEvent with _$MakananEvent {
  const factory MakananEvent.started() = _Started;
  const factory MakananEvent.getAllMakanan() = _Started;
}
