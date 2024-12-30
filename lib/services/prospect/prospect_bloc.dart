import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled6/repository/image_repository.dart';
import 'package:untitled6/repository/prospect_types_repository.dart';

import '../../model/prospect.dart';
import '../../model/prospect_types.dart';
import '../../repository/prospect_repository.dart';

part 'prospect_event.dart';
part 'prospect_state.dart';
part 'prospect_bloc.freezed.dart';

class ProspectBloc extends Bloc<ProspectEvent, ProspectState> {
  final ProspectRepository _prospectRepository;
  final ProspectTypesRepository _prospectTypesRepository;
  final ImageRepository _imageRepository;
  ProspectBloc(this._prospectRepository, this._prospectTypesRepository,
      this._imageRepository)
      : super(const ProspectState.initial()) {
    on<ProspectEvent>((event, emit) async {
      await event.map(

          /// Started event : we fetch prospect data
          started: (_) async {
        emit(const ProspectState.loading());
        final prospects = await _prospectRepository.getProspectList();
        // final types = await _prospectTypesRepository.getProspectTypes();
        emit(ProspectState.success(prospects, []));
      },

          /// Add event : we add a prospect
          add: (e) async {
        emit(const ProspectState.loading());
        String? url = ';';
        if (e.file.path != '') {
          url = await _imageRepository.uploadImage(e.file);
        } else if (e.prospect.image == '') {
          url =
              'https://res.cloudinary.com/dbxeapu5q/image/upload/v1735389785/kyahvjgo8ovozyexdb8c.png';
        } else {
          url = e.prospect.image;
        }

        e.prospect.image = url!;
        await _prospectRepository.saveProspect(e.prospect);

        emit(const ProspectState.added());
      },

          /// Init event : we reset the state
          init: (_) {
        emit(const ProspectState.initial());
      }, newUpdate: (_NewUpdate value) async {
        emit(const ProspectState.loadingUpdate());
        try {
          String? url = '';
          if (value.file.path != '') {
            url = await _imageRepository.uploadImage(value.file);
          } else if (value.prospect.image == '') {
            url =
                'https://res.cloudinary.com/dbxeapu5q/image/upload/v1735389785/kyahvjgo8ovozyexdb8c.png';
          } else {
            url = value.prospect.image;
          }

          value.prospect.image = url!;
          await _prospectRepository.updateProspect(value.prospect);
          emit(const ProspectState.updated());
        } on Exception catch (e) {
          rethrow;
        }
      },

      initUpdate: (_InitUpdate value) {
        emit(const ProspectState.updateProspect());},
      );

      /// Delete event : we delete a prospec);
    });
  }
}
