import 'package:bloc/bloc.dart';
import 'package:herbaria/repositories/camera_gallery_repository.dart';
import 'package:injectable/injectable.dart';

part 'analyzer_state.dart';

@singleton
class AnalyzerCubit extends Cubit<AnalyzerState> {
  final CameraGalleryRepository _cameraGalleryRepository;
  AnalyzerCubit(this._cameraGalleryRepository) : super(AnalyzerInitial());

  void cleanAnalyzerResult() async {
    print('Cleaning results...');
    await Future.delayed(Duration.zero);
    emit(AnalyzerInitial());
  }

  void openCamera() async {
    await _cameraGalleryRepository.openCamera();
    emit(AnalyzerLoaded('Nome da planta', '99.3', '''
   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
'''));
  }

  void openGallery() async {
    await _cameraGalleryRepository.openGallery();
    emit(AnalyzerLoaded('Nome da planta', '84.69', '''
   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
'''));
  }
}
