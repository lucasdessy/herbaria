import 'package:herbaria/models/plant_cache_item.dart';
import 'package:herbaria/util/plant_cache.dart';

class HistoryItem {
  PlantCacheItem plant;
  String precision;
  DateTime whenWasTaken;
  HistoryItem(this.plant, this.precision, this.whenWasTaken);
  Map<String, dynamic> toJson() {
    return {
      'plantCode': plant.plantCode,
      'precision': precision,
      'whenWasTaken': whenWasTaken.toIso8601String()
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      PlantCache()[json['plantCode'].toString()],
      json['precision'],
      DateTime.parse(json['whenWasTaken']),
    );
  }
}
