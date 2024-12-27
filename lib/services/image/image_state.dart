part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.initial() = _Initial;
  const factory ImageState.loaded(File image) = _Loaded;
}
