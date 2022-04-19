import 'package:bloc/bloc.dart';
import 'package:herbaria/repositories/camera_gallery_repository.dart';
import 'package:injectable/injectable.dart';

part 'analyzer_state.dart';

@singleton
class AnalyzerCubit extends Cubit<AnalyzerState> {
  final CameraGalleryRepository _cameraGalleryRepository;
  AnalyzerCubit(this._cameraGalleryRepository) : super(AnalyzerInitial());

  void cleanAnalyzerResult() {
    print('Cleaning results...');
    emit(AnalyzerInitial());
  }

  void openCamera() async {
    print('sus');
    await _cameraGalleryRepository.openCamera();
    print('amogus');
    emit(AnalyzerLoaded('sus amogus'));
  }

  void openGallery() {
    _cameraGalleryRepository.openGallery();
  }
}
