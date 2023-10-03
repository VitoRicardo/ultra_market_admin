import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_market_admin/cubit/image_state.dart';
import 'package:ultra_market_admin/repository/image_repository.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository _imageRepository;
  ImageCubit({required ImageRepository imageRepository})
      : _imageRepository = imageRepository,
        super(ImageState.initial());

  void pickImage() async {
    emit(state.copyWith(status: ImageStatus.loading));
    try {
      await _imageRepository.pickImage();
      if (_imageRepository.imagePath == null) throw Exception();
      print('vou chamar o sucesso');
      emit(state.copyWith(status: ImageStatus.success));
    } catch (e) {
      print('vou chamar o erro');
      emit(state.copyWith(status: ImageStatus.error));
    }
  }

  void cropImage() async {
    emit(state.copyWith(status: ImageStatus.loading));
    try {
      await _imageRepository.crop();
      emit(state.copyWith(status: ImageStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ImageStatus.error));
    }
  }

  void deleteImage() {
    emit(state.copyWith(status: ImageStatus.loading));
    try {
      _imageRepository.delete();
      emit(state.copyWith(status: ImageStatus.empty));
    } catch (e) {
      emit(state.copyWith(status: ImageStatus.error));
    }
  }
}
