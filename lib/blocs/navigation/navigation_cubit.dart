import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:injectable/injectable.dart';

part 'navigation_state.dart';

@singleton
class NavigationCubit extends Cubit<NavigationState> {
  final AnalyzerCubit _analyzerCubit;
  late StreamSubscription _analyzerSubscription;
  NavigationCubit(this._analyzerCubit) : super(NavigationState()) {
    _analyzerSubscription =
        _analyzerCubit.stream.listen(_onAnalyzerStateChanged);
  }

  void _onAnalyzerStateChanged(AnalyzerState state) {
    if (state is AnalyzerLoaded) {
      emit(NavigationState(shouldShowResultScreen: true));
    }
  }

  bool pop(Route<dynamic> route, dynamic result) {
    if (_analyzerCubit.state is AnalyzerLoaded) {
      _analyzerCubit.cleanAnalyzerResult();
    }
    return route.didPop(result);
  }

  @override
  Future<void> close() async {
    await _analyzerSubscription.cancel();
    return super.close();
  }
}
