import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';
part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImagePicker picker = ImagePicker();
  ImageCubit() : super(const ImageState.initial());

  loadImage() async {
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    File file = File(xFile!.path);
    emit(ImageState.loaded(file));
  }
}
