part of 'history_cubit.dart';

@immutable
class HistoryState {
  final List<HistoryItem> history;
  const HistoryState.fromList(List<HistoryItem> items) : history = items;
  HistoryState() : history = [];

  HistoryState pushNewItem(HistoryItem item) {
    final newList = <HistoryItem>[];
    for (final element in history) {
      newList.add(element);
    }
    newList.add(item);
    return HistoryState.fromList(newList);
  }
}

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
