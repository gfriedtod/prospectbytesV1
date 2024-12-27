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
      await event.map(started: (_) async {
        emit(const ProspectState.loading());
        final prospects = await _prospectRepository.getProspectList();
        final types = await _prospectTypesRepository.getProspectTypes();
        emit(ProspectState.success(prospects, types));
      }, add: (e) async {
        emit(const ProspectState.loading());

        String? url = await _imageRepository.uploadImage(e.file);
        e.prospect.image = url!;
        await _prospectRepository.saveProspect(e.prospect);

        emit(const ProspectState.added());
      }, init: (_) {
        emit(const ProspectState.initial());
      });

      // TODO: implement event handler
    });
  }
}
