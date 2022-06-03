import 'dart:convert';

class HistoryItem {
  String plantName;
  String precision;
  String description;
  List<String> imagesAssetLocations;
  HistoryItem(this.plantName, this.precision, this.description,
      this.imagesAssetLocations);
  Map<String, dynamic> toJson() {
    return {
      'plantName': plantName,
      'precision': precision,
      'description': description,
      'image': imagesAssetLocations,
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      json['plantName'],
      json['precision'],
      json['description'],
      List.from(jsonDecode(json['imageAssetLocation'])),
    );
  }
}
