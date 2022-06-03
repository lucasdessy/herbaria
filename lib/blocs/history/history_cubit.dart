import 'package:herbaria/util/print.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../models/history_item.dart';

part 'history_state.dart';

@singleton
class HistoryCubit extends HydratedCubit<HistoryState> {
  static const keyName = 'history';
  HistoryCubit() : super(HistoryState());
  void addNewItem(HistoryItem item) {
    emit(state.pushNewItem(item));
    devPrint('New item added to history.');
  }

  @override
  HistoryState? fromJson(Map<String, dynamic> json) {
    try {
      final list = (json[keyName] as List<Map<String, dynamic>>);
      final formattedList = <HistoryItem>[];
      for (final element in list) {
        formattedList.add(HistoryItem.fromJson(element));
      }
      return HistoryState.fromList(formattedList);
    } catch (err) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HistoryState state) {
    try {
      return {
        keyName:
            state.history.map<Map<String, dynamic>>((e) => e.toJson()).toList()
      };
    } catch (err) {
      return null;
    }
  }
}
