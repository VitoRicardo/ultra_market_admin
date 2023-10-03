import 'package:image_picker/image_picker.dart';

enum ImageStatus {
  empty,
  loading,
  success,
  error,
}

class ImageState {
  final ImageStatus status;
  final XFile? image;

  ImageState({required this.status, this.image});

  factory ImageState.initial() {
    return ImageState(status: ImageStatus.empty);
  }

  ImageState copyWith({XFile? image, ImageStatus? status}) {
    return ImageState(
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }
}
