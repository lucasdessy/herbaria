import 'package:herbaria/models/plant_cache_item.dart';
import 'package:herbaria/util/plant_cache.dart';

class HistoryItem {
  PlantCacheItem plant;
  String precision;
  HistoryItem(this.plant, this.precision);
  Map<String, dynamic> toJson() {
    return {
      'plantCode': plant.plantCode,
      'precision': precision,
    };
  }

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      PlantCache()[json['plantCode'].toString()],
      json['precision'],
    );
  }
}
