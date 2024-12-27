part of 'prospect_bloc.dart';

@freezed
class ProspectState with _$ProspectState {
  const factory ProspectState.initial() = _Initial;
  const factory ProspectState.loading() = _Loading;
  const factory ProspectState.success(
      List<Prospect> prospects, List<ProspectTypes> types) = _Success;

  const factory ProspectState.failure() = _Failure;
  const factory ProspectState.empty() = _Empty;
  const factory ProspectState.added() = _Added;
}
