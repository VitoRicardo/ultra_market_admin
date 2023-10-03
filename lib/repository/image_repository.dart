import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository {
  String? imagePath;
  ImageRepository({this.imagePath});

  Future pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    imagePath = (await imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    ))
        ?.path;
    if (imagePath == null) throw Exception();
  }

  Future crop({
    CropStyle cropStyle = CropStyle.rectangle,
  }) async {
    final ImageCropper imageCropper = ImageCropper();
    String? path = (await imageCropper.cropImage(
      sourcePath: imagePath!,
      cropStyle: cropStyle,
      compressFormat: ImageCompressFormat.png,
    ))
        ?.path;
    if (path != null) imagePath = path;
  }

  delete() {
    if (imagePath != null) imagePath = null;
  }
}
