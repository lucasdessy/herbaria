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
