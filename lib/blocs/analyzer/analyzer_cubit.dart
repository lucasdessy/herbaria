import 'package:bloc/bloc.dart';
import 'package:herbaria/repositories/camera_gallery_repository.dart';
import 'package:herbaria/util/print.dart';
import 'package:injectable/injectable.dart';

part 'analyzer_state.dart';

@singleton
class AnalyzerCubit extends Cubit<AnalyzerState> {
  // TODO: Treat exceptions better
  // TODO: Make a local plant cache for descriptions.
  final CameraGalleryRepository _cameraGalleryRepository;
  AnalyzerCubit(this._cameraGalleryRepository) : super(AnalyzerInitial());

  void cleanAnalyzerResult() async {
    await Future.delayed(Duration.zero);
    emit(AnalyzerInitial());
  }

  void openCamera() async {
    try {
      final result = await _cameraGalleryRepository.openCamera();
      emit(AnalyzerLoaded(result.plant, result.accuracy, 'Descrição'));
    } catch (err, trace) {
      devPrint(err, trace);
    }
  }

  void openGallery() async {
    try {
      final result = await _cameraGalleryRepository.openGallery();
      emit(AnalyzerLoaded(result.plant, result.accuracy, 'Descrição'));
    } catch (err, trace) {
      devPrint(err, trace);
    }
  }
}
