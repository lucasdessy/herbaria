import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class CameraGalleryRepository {
  final _picker = ImagePicker();

  Future<void> openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  }

  Future<void> openGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  }
}
