import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:herbaria/models/exceptions.dart';
import 'package:herbaria/util/config.dart';
import 'package:herbaria/util/print.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../models/ai_response.dart';

@singleton
class CameraGalleryRepository {
  final _picker = ImagePicker();
  final httpClient = Dio(BaseOptions(baseUrl: HerbariaConfig.baseUrl));

  Future<AiResponse?> openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return null;
    }
    return _analyzeImage(pickedFile);
  }

  Future<AiResponse?> openGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    }
    return _analyzeImage(pickedFile);
  }

  Future<AiResponse?> _checkIfFileExists(String fileName) async {
    try {
      devPrint('_checkIfFileExists called. Trying to post /ai');
      final response =
          await httpClient.post('/ai', data: {"filename": fileName});
      if (response.statusCode == 200) {
        devPrint('File does exists. Returning');
        return AiResponse.fromJson(response.data as Map<String, dynamic>);
      }
      devPrint('File does not exists. Returning');
      return null;
    } on DioError catch (err) {
      devPrint(
          'Error posting /ai. status: ${err.response?.statusCode} response: ${err.response?.data}');
      return null;
    }
  }

  Future<AiResponse> _analyzeImage(XFile file) async {
    devPrint('_analyzeImage called');
    final fileBytes = await file.readAsBytes();
    final md5Hash = md5.convert(fileBytes);
    final String fileName = md5Hash.toString();
    devPrint('Filename: $fileName');
    var aiResponse = await _checkIfFileExists(fileName);
    if (aiResponse != null) {
      return aiResponse;
    }

    devPrint('Creating form data to upload image.');

    final formData = FormData.fromMap(
      {
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      },
    );
    devPrint('Uploading file...');
    final response = await httpClient.post(
      '/files',
      data: formData,
    );
    if (response.statusCode != 200) {
      throw HerbariaException(
        "Ocorreu um erro ao comunicar com o servidor.",
        "Tente novamente mais tarde",
      );
    }
    devPrint('Triggering AI check.');
    aiResponse = await _checkIfFileExists(fileName);
    if (aiResponse != null) {
      return aiResponse;
    }
    throw HerbariaException(
      "Ocorreu um erro interno.",
    );
  }
}
