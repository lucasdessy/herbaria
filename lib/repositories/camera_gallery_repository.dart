import 'package:crypto/crypto.dart';

import 'package:dio/dio.dart';
import 'package:herbaria/models/exceptions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class CameraGalleryRepository {
  final _picker = ImagePicker();
  final httpClient = Dio(BaseOptions(baseUrl: 'http://localhost'));

  Future<_AiResponse?> openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) {
      return null;
    }
    return _analyzeImage(pickedFile);
  }

  Future<_AiResponse?> openGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return null;
    }
    return _analyzeImage(pickedFile);
  }

  Future<_AiResponse?> _checkIfFileExists(String fileName) async {
    final response = await httpClient.post('/ai', data: {"filename": fileName});
    if (response.statusCode == 200) {
      return _AiResponse.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }

  Future<_AiResponse> _analyzeImage(XFile file) async {
    final fileBytes = await file.readAsBytes();
    final md5Hash = md5.convert(fileBytes);
    final String fileName = md5Hash.toString();
    var aiResponse = await _checkIfFileExists(fileName);
    if (aiResponse != null) {
      return aiResponse;
    }

    final formData = FormData.fromMap(
      {
        'file': MultipartFile.fromBytes(
          fileBytes,
          filename: fileName,
        ),
      },
    );
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
    aiResponse = await _checkIfFileExists(fileName);
    if (aiResponse != null) {
      return aiResponse;
    }
    throw HerbariaException(
      "Ocorreu um erro interno.",
    );
  }
}

class _AiResponse {
  String plant;
  String accuracy;
  _AiResponse(this.plant, this.accuracy);

  factory _AiResponse.fromJson(Map<String, dynamic> json) {
    return _AiResponse(json["plant"].toString(), json["accuracy"].toString());
  }
}
