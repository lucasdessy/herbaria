import 'package:bloc/bloc.dart';
import 'package:herbaria/blocs/history/history_cubit.dart';
import 'package:herbaria/models/exceptions.dart';
import 'package:herbaria/repositories/camera_gallery_repository.dart';
import 'package:herbaria/util/config.dart';
import 'package:herbaria/util/plant_cache.dart';
import 'package:herbaria/util/print.dart';
import 'package:injectable/injectable.dart';

import '../../models/ai_response.dart';
import '../../models/history_item.dart';

part 'analyzer_state.dart';

@singleton
class AnalyzerCubit extends Cubit<AnalyzerState> {
  final PlantCache _plantCache = PlantCache();
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
      emit(AnalyzerLoading());
      final result = await _cameraGalleryRepository.openCamera();
      _loadItemFromResponse(result);
    } on HerbariaException catch (err) {
      devPrint(err);
      emit(AnalyzerError(err));
    } catch (err, trace) {
      devPrint(err, trace);
      emit(AnalyzerError(HerbariaException.unknownError()));
    }
  }

  Future<void> openGallery() async {
    try {
      emit(AnalyzerLoading());
      final result = await _cameraGalleryRepository.openGallery();
      _loadItemFromResponse(result);
    } on HerbariaException catch (err) {
      devPrint(err);
      emit(AnalyzerError(err));
    } catch (err, trace) {
      devPrint(err, trace);
      emit(AnalyzerError(HerbariaException.unknownError()));
    }
  }

  void _loadItemFromResponse(AiResponse? response) {
    if (response == null) {
      emit(AnalyzerInitial());
      return;
    }
    devPrint(response);
    final acc = double.tryParse(response.accuracy);
    if (acc == null) {
      emit(AnalyzerInitial());
      return;
    }
    if (acc < HerbariaConfig.minAcc) {
      emit(
        AnalyzerError(
          HerbariaException('Não foi possível identificar a planta na foto.',
              'Acurácia muito baixa: ${acc.toStringAsFixed(1)}%'),
        ),
      );
      return;
    }

    final item =
        HistoryItem(_plantCache[response.plantCode], response.accuracy);
    emit(AnalyzerLoaded(item));
    _historyCubit.addNewItem(item);
  }

  Future<void> loadFromHistory(HistoryItem item) async {
    emit(AnalyzerLoaded(item));
  }
}
