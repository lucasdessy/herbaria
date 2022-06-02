import 'package:bloc/bloc.dart';
import 'package:herbaria/blocs/history/history_cubit.dart';
import 'package:herbaria/repositories/camera_gallery_repository.dart';
import 'package:herbaria/util/print.dart';
import 'package:injectable/injectable.dart';

part 'analyzer_state.dart';

@singleton
class AnalyzerCubit extends Cubit<AnalyzerState> {
  // TODO: Treat exceptions better
  // TODO: Make a local plant cache for descriptions.
  final CameraGalleryRepository _cameraGalleryRepository;
  final HistoryCubit _historyCubit;
  AnalyzerCubit(this._cameraGalleryRepository, this._historyCubit)
      : super(AnalyzerInitial());

  Future<void> cleanAnalyzerResult() async {
    await Future.delayed(Duration.zero);
    emit(AnalyzerInitial());
  }

  Future<void> openCamera() async {
    try {
      final result = await _cameraGalleryRepository.openCamera();
      final item = HistoryItem(result.plant, result.accuracy, 'Descrição',
          ['assets/flor_teste.png']);
      emit(AnalyzerLoaded(item));
      _historyCubit.addNewItem(item);
    } catch (err, trace) {
      devPrint(err, trace);
      emit(AnalyzerError(err.toString()));
    }
  }

  Future<void> openGallery() async {
    try {
      final result = await _cameraGalleryRepository.openGallery();
      final item = HistoryItem(result.plant, result.accuracy, 'Descrição',
          ['assets/flor_teste.png']);
      emit(AnalyzerLoaded(item));
      _historyCubit.addNewItem(item);
    } catch (err, trace) {
      devPrint(err, trace);
      emit(AnalyzerError(err.toString()));
    }
  }

  Future<void> loadFromHistory(HistoryItem item) async {
    emit(AnalyzerLoaded(item));
  }
}
