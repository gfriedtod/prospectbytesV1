part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
   factory ImageState.initial(File image) = _Initial;
  const factory ImageState.loaded(File image) = _Loaded;
}
