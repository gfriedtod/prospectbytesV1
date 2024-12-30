part of 'prospect_bloc.dart';

@freezed
class ProspectState with _$ProspectState {
  const factory ProspectState.initial() = _Initial;
  const factory ProspectState.loading() = _Loading;
  const factory ProspectState.success(
      List<Prospect> prospects, List<ProspectTypes> types) = _Success;
  const factory ProspectState.updateProspect() = _UpdateProspect;
  const factory ProspectState.updated() = _Updated;
  const factory ProspectState.added() = _Added;
  const factory ProspectState.loadingUpdate() = _LoadingUpdate;

}
