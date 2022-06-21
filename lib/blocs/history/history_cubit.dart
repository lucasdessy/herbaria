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
      devPrint('HistoryCubit: fromJson()');
      devPrint(json);
      final list = (json[keyName] as List);
      final formattedList = <HistoryItem>[];
      for (final element in list) {
        formattedList
            .add(HistoryItem.fromJson(element as Map<String, dynamic>));
      }
      return HistoryState.fromList(formattedList);
    } catch (err) {
      devPrint(err);
      devPrint('HistoryCubit: fromJson() error');
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HistoryState state) {
    try {
      devPrint('HistoryCubit: toJson()');
      final json = {
        keyName:
            state.history.map<Map<String, dynamic>>((e) => e.toJson()).toList()
      };
      devPrint(json);
      return json;
    } catch (err) {
      devPrint('HistoryCubit: toJson() error');
      return null;
    }
  }
}
