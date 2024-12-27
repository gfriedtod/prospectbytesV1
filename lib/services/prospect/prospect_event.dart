part of 'prospect_bloc.dart';

@freezed
class ProspectEvent with _$ProspectEvent {
  const factory ProspectEvent.started() = _Started;

  const factory ProspectEvent.add(Prospect prospect, File file) = _Add;

  const factory ProspectEvent.init() = _Init;
}
